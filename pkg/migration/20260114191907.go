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

package migration

import (
	"src.techknowlogick.com/xormigrate"
	"xorm.io/xorm"
)

type projectViews20260114191907 struct {
	DoingBucketID int64 `xorm:"bigint INDEX null"`
}

func (projectViews20260114191907) TableName() string {
	return "project_views"
}

type tasks20260114191907 struct {
	PercentDone float64 `xorm:"DOUBLE null"`
}

func (tasks20260114191907) TableName() string {
	return "tasks"
}

type buckets20260114191907 struct {
	SortBy  []string `xorm:"JSON null"`
	OrderBy []string `xorm:"JSON null"`
}

func (buckets20260114191907) TableName() string {
	return "buckets"
}

func init() {
	migrations = append(migrations, &xormigrate.Migration{
		ID:          "20260114191907",
		Description: "Add doing_bucket_id to project_views, percent_done to tasks, and sort fields to buckets",
		Migrate: func(tx *xorm.Engine) error {
			err := tx.Sync2(projectViews20260114191907{})
			if err != nil {
				return err
			}
			err = tx.Sync2(tasks20260114191907{})
			if err != nil {
				return err
			}
			err = tx.Sync2(buckets20260114191907{})
			if err != nil {
				return err
			}
			
			// Set default empty arrays for existing buckets
			_, err = tx.Exec("UPDATE buckets SET sort_by = '[]' WHERE sort_by IS NULL")
			if err != nil {
				return err
			}
			_, err = tx.Exec("UPDATE buckets SET order_by = '[]' WHERE order_by IS NULL")
			return err
		},
		Rollback: func(tx *xorm.Engine) error {
			return nil
		},
	})
}
