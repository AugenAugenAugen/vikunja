// Vikunja is a to-do list application to facilitate your life.
// Copyright 2018-present Vikunja and contributors. All rights reserved.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

package models

import (
	"time"

	"code.vikunja.io/api/pkg/db"
	"code.vikunja.io/api/pkg/events"
	"code.vikunja.io/api/pkg/user"
	"code.vikunja.io/api/pkg/web"
	"xorm.io/xorm"
)

// TaskBucket represents the relation between a task and a kanban bucket.
// A task can only appear once per project view which is ensured by a
// unique index on the combination of task_id and project_view_id.
type TaskBucket struct {
	BucketID int64   `xorm:"bigint not null index" json:"bucket_id" param:"bucket"`
	Bucket   *Bucket `xorm:"-" json:"bucket"`
	// The task which belongs to the bucket. Together with ProjectViewID
	// this field is part of a unique index to prevent duplicates.
	TaskID int64 `xorm:"bigint not null index unique(task_view)" json:"task_id"`
	// The view this bucket belongs to. Combined with TaskID this forms a
	// unique index.
	ProjectViewID int64 `xorm:"bigint not null index unique(task_view)" json:"project_view_id" param:"view"`
	ProjectID     int64 `xorm:"-" json:"-" param:"project"`
	Task          *Task `xorm:"-" json:"task"`

	web.Permissions `xorm:"-" json:"-"`
	web.CRUDable    `xorm:"-" json:"-"`
}

func (b *TaskBucket) TableName() string {
	return "task_buckets"
}

func (b *TaskBucket) CanUpdate(s *xorm.Session, a web.Auth) (bool, error) {
	// First, get the view to check the bucket configuration mode
	view, err := GetProjectViewByIDAndProject(s, b.ProjectViewID, b.ProjectID)
	if err != nil {
		return false, err
	}

	// For filter-based buckets, check project permissions directly
	if view.BucketConfigurationMode == BucketConfigurationModeFilter {
		p := &Project{ID: view.ProjectID}
		return p.CanUpdate(s, a)
	}

	// For manual buckets, use existing bucket permission check
	bucket := Bucket{
		ID:            b.BucketID,
		ProjectID:     b.ProjectID,
		ProjectViewID: b.ProjectViewID,
	}
	return bucket.canDoBucket(s, a)
}

func (b *TaskBucket) upsert(s *xorm.Session) (err error) {
	count, err := s.Where("task_id = ? AND project_view_id = ?", b.TaskID, b.ProjectViewID).
		Cols("bucket_id").
		Update(b)
	if err != nil {
		return
	}

	if count == 0 {
		_, err = s.Insert(b)
		if err != nil {
			// Check if this is a unique constraint violation for the task_buckets table
			if db.IsUniqueConstraintError(err, "UQE_task_buckets_task_project_view") {
				return ErrTaskAlreadyExistsInBucket{
					TaskID:        b.TaskID,
					ProjectViewID: b.ProjectViewID,
				}
			}
			return
		}
	}

	return
}

// updateTaskBucket is internally used to actually do the update.
func updateTaskBucket(s *xorm.Session, a web.Auth, b *TaskBucket) (err error) {
	view, err := GetProjectViewByIDAndProject(s, b.ProjectViewID, b.ProjectID)
	if err != nil {
		return err
	}

	// Handle filter-based bucket mode
	if view.BucketConfigurationMode == BucketConfigurationModeFilter {
		return updateTaskBucketForFilterMode(s, a, b, view)
	}

	// Handle manual bucket mode (existing logic)
	return updateTaskBucketForManualMode(s, a, b, view)
}

// updateTaskBucketForFilterMode handles moving tasks between filter-based buckets
func updateTaskBucketForFilterMode(s *xorm.Session, a web.Auth, b *TaskBucket, view *ProjectView) (err error) {
	// Check if filter bucket is draggable
	if !view.BucketConfigurationDraggable {
		return ErrFilterBucketNotDraggable{
			ProjectViewID: view.ID,
			BucketID:      b.BucketID,
		}
	}

	// Validate target bucket index
	if b.BucketID < 0 || int(b.BucketID) >= len(view.BucketConfiguration) {
		return ErrBucketDoesNotExist{BucketID: b.BucketID}
	}

	// Get the task
	task := &Task{ID: b.TaskID}
	err = task.ReadOne(s, a)
	if err != nil {
		return err
	}

	// Get the target bucket filter
	targetBucketConfig := view.BucketConfiguration[b.BucketID]
	if targetBucketConfig.Filter == nil || targetBucketConfig.Filter.Filter == "" {
		// Empty filter bucket - no task modifications needed, task will appear in this bucket
		// if it doesn't match any other bucket's filter
		b.Task = task
		return nil
	}

	// Parse the target filter
	filters, err := getTaskFiltersFromFilterString(targetBucketConfig.Filter.Filter, targetBucketConfig.Filter.FilterTimezone)
	if err != nil {
		return err
	}

	// Get the modifications needed to match the target filter
	_, modifications := CanModifyFilterBucket(filters)

	// Apply modifications to the task
	err = applyFilterModificationsToTask(s, a, task, modifications)
	if err != nil {
		return err
	}

	b.Task = task
	return nil
}

// applyFilterModificationsToTask applies filter modifications to a task
func applyFilterModificationsToTask(s *xorm.Session, a web.Auth, task *Task, modifications []FilterBucketModification) (err error) {
	var updateCols []string

	for _, mod := range modifications {
		switch mod.Field {
		case "done":
			if boolVal, ok := mod.Value.(bool); ok {
				task.Done = boolVal
				if task.Done {
					task.DoneAt = time.Now()
				} else {
					task.DoneAt = time.Time{}
				}
				updateCols = append(updateCols, "done", "done_at")
			}
		case "priority":
			if intVal, ok := mod.Value.(int64); ok {
				task.Priority = intVal
				updateCols = append(updateCols, "priority")
			}
		case "percent_done":
			if floatVal, ok := mod.Value.(float64); ok {
				task.PercentDone = floatVal
				updateCols = append(updateCols, "percent_done")
			}
		case "due_date":
			if timeVal, ok := mod.Value.(time.Time); ok {
				task.DueDate = timeVal
				updateCols = append(updateCols, "due_date")
			}
		case "start_date":
			if timeVal, ok := mod.Value.(time.Time); ok {
				task.StartDate = timeVal
				updateCols = append(updateCols, "start_date")
			}
		case "end_date":
			if timeVal, ok := mod.Value.(time.Time); ok {
				task.EndDate = timeVal
				updateCols = append(updateCols, "end_date")
			}
		case "labels", "label_id":
			// Handle label assignment
			if intVal, ok := mod.Value.(int64); ok {
				err = updateTaskLabelsForFilter(s, a, task, intVal, mod.Comparator)
				if err != nil {
					return err
				}
			}
		case "assignees":
			// Handle assignee assignment
			if stringSlice, ok := mod.Value.([]string); ok && len(stringSlice) > 0 {
				err = updateTaskAssigneesForFilter(s, a, task, stringSlice, mod.Comparator)
				if err != nil {
					return err
				}
			}
		}
	}

	// Update the task with the modified columns
	if len(updateCols) > 0 {
		_, err = s.Where("id = ?", task.ID).
			Cols(updateCols...).
			Update(task)
		if err != nil {
			return
		}
	}

	return nil
}

// updateTaskLabelsForFilter updates task labels when moving to a filter bucket
func updateTaskLabelsForFilter(s *xorm.Session, a web.Auth, task *Task, labelID int64, comparator string) (err error) {
	// For != comparator, remove the label
	if comparator == "!=" {
		_, err = s.Where("task_id = ? AND label_id = ?", task.ID, labelID).Delete(&LabelTask{})
		return err
	}

	// Check if label already exists on task
	for _, l := range task.Labels {
		if l.ID == labelID {
			return nil // Label already assigned
		}
	}

	// Add the label to the task
	lt := &LabelTask{
		TaskID:  task.ID,
		LabelID: labelID,
	}
	return lt.Create(s, a)
}

// updateTaskAssigneesForFilter updates task assignees when moving to a filter bucket
func updateTaskAssigneesForFilter(s *xorm.Session, a web.Auth, task *Task, usernames []string, comparator string) (err error) {
	if len(usernames) == 0 {
		return nil
	}

	// Get the first username from the filter
	username := usernames[0]

	// Find the user by username
	u, err := user.GetUserByUsername(s, username)
	if err != nil {
		return err
	}

	// For != comparator, remove the assignee
	if comparator == "!=" {
		_, err = s.Where("task_id = ? AND user_id = ?", task.ID, u.ID).Delete(&TaskAssginee{})
		return err
	}

	// Check if user is already assigned
	for _, assignee := range task.Assignees {
		if assignee.Username == username {
			return nil // Already assigned
		}
	}

	// Add the assignee to the task
	ta := &TaskAssginee{
		TaskID: task.ID,
		UserID: u.ID,
	}
	return ta.Create(s, a)
}

// updateTaskBucketForManualMode handles moving tasks between manual buckets (existing logic)
func updateTaskBucketForManualMode(s *xorm.Session, a web.Auth, b *TaskBucket, view *ProjectView) (err error) {
	oldTaskBucket := &TaskBucket{}
	_, err = s.
		Where("task_id = ? AND project_view_id = ?", b.TaskID, b.ProjectViewID).
		Get(oldTaskBucket)
	if err != nil {
		return
	}

	if oldTaskBucket.BucketID == b.BucketID {
		// no need to do anything
		return
	}

	bucket, err := getBucketByID(s, b.BucketID)
	if err != nil {
		return err
	}

	// If there is a bucket set, make sure they belong to the same project as the task
	if view.ID != bucket.ProjectViewID {
		return ErrBucketDoesNotBelongToProjectView{
			ProjectViewID: view.ID,
			BucketID:      bucket.ID,
		}
	}

	task := &Task{ID: b.TaskID}
	err = task.ReadOne(s, a)
	if err != nil {
		return err
	}

	// Check the bucket limit
	// Only check the bucket limit if the task is being moved between buckets, allow reordering the task within a bucket
	if b.BucketID != 0 && b.BucketID != oldTaskBucket.BucketID {
		taskCount, err := checkBucketLimit(s, a, task, bucket)
		if err != nil {
			return err
		}
		bucket.Count = taskCount
	}

	var updateBucket = true

	// mark task done if moved into or out of the done bucket
	// Only change the done state if the task's done value actually changes
	var doneChanged bool
	if view.DoneBucketID != 0 {
		if view.DoneBucketID == b.BucketID && !task.Done {
			doneChanged = true
			task.Done = true
			if task.isRepeating() {
				oldTask := *task
				oldTask.Done = false
				updateDone(&oldTask, task)
				updateBucket = false
				b.BucketID = oldTaskBucket.BucketID
			}
		}

		if oldTaskBucket.BucketID == view.DoneBucketID && task.Done && b.BucketID != view.DoneBucketID {
			doneChanged = true
			task.Done = false
		}
	}

	if doneChanged {
		if task.Done {
			task.DoneAt = time.Now()
		} else {
			task.DoneAt = time.Time{}
		}
		_, err = s.Where("id = ?", task.ID).
			Cols(
				"done",
				"due_date",
				"start_date",
				"end_date",
				"done_at",
			).
			Update(task)
		if err != nil {
			return
		}

		err = task.updateReminders(s, task)
		if err != nil {
			return
		}

		// Since the done state of the task was changed, we need to move the task into all done buckets everywhere
		if task.Done {
			viewsWithDoneBucket := []*ProjectView{}
			err = s.
				Where("project_id = ? AND view_kind = ? AND bucket_configuration_mode = ? AND id != ? AND done_bucket_id != 0",
					view.ProjectID, ProjectViewKindKanban, BucketConfigurationModeManual, view.ID).
				Find(&viewsWithDoneBucket)
			if err != nil {
				return
			}
			for _, v := range viewsWithDoneBucket {
				newBucket := &TaskBucket{
					TaskID:        task.ID,
					ProjectViewID: v.ID,
					BucketID:      v.DoneBucketID,
				}
				err = newBucket.upsert(s)
				if err != nil {
					return
				}
			}
		}
	}

	if updateBucket {
		err = b.upsert(s)
		if err != nil {
			return
		}
		bucket.Count++
	}

	b.Task = task
	b.Bucket = bucket

	return
}

// Update is the handler to update a task bucket
// @Summary Update a task bucket
// @Description Updates a task in a bucket
// @tags task
// @Accept json
// @Produce json
// @Security JWTKeyAuth
// @Param project path int true "Project ID"
// @Param view path int true "Project View ID"
// @Param bucket path int true "Bucket ID"
// @Param taskBucket body models.TaskBucket true "The id of the task you want to move into the bucket."
// @Success 200 {object} models.TaskBucket "The updated task bucket."
// @Failure 400 {object} web.HTTPError "Invalid task bucket object provided."
// @Failure 500 {object} models.Message "Internal error"
// @Router /projects/{project}/views/{view}/buckets/{bucket}/tasks [post]
func (b *TaskBucket) Update(s *xorm.Session, a web.Auth) (err error) {
	err = updateTaskBucket(s, a, b)
	if err != nil {
		return err
	}

	doer, _ := user.GetFromAuth(a)
	return events.Dispatch(&TaskUpdatedEvent{
		Task: b.Task,
		Doer: doer,
	})
}
