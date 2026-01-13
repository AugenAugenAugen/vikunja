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
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestCanModifyFilterBucket(t *testing.T) {
	t.Run("modifiable filter - priority equals", func(t *testing.T) {
		filters := []*taskFilter{
			{
				field:      "priority",
				comparator: taskFilterComparatorEquals,
				value:      int64(3),
			},
		}
		canModify, mods := CanModifyFilterBucket(filters)
		assert.True(t, canModify)
		assert.Len(t, mods, 1)
		assert.Equal(t, "priority", mods[0].Field)
		assert.Equal(t, int64(3), mods[0].Value)
	})

	t.Run("modifiable filter - done equals", func(t *testing.T) {
		filters := []*taskFilter{
			{
				field:      "done",
				comparator: taskFilterComparatorEquals,
				value:      true,
			},
		}
		canModify, mods := CanModifyFilterBucket(filters)
		assert.True(t, canModify)
		assert.Len(t, mods, 1)
		assert.Equal(t, "done", mods[0].Field)
		assert.Equal(t, true, mods[0].Value)
	})

	t.Run("non-modifiable filter - project_id", func(t *testing.T) {
		filters := []*taskFilter{
			{
				field:      "project_id",
				comparator: taskFilterComparatorEquals,
				value:      int64(1),
			},
		}
		canModify, _ := CanModifyFilterBucket(filters)
		assert.False(t, canModify)
	})

	t.Run("non-modifiable filter - created", func(t *testing.T) {
		filters := []*taskFilter{
			{
				field:      "created",
				comparator: taskFilterComparatorEquals,
				value:      "2024-01-01",
			},
		}
		canModify, _ := CanModifyFilterBucket(filters)
		assert.False(t, canModify)
	})

	t.Run("non-modifiable comparator - greater than", func(t *testing.T) {
		filters := []*taskFilter{
			{
				field:      "priority",
				comparator: taskFilterComparatorGreater,
				value:      int64(3),
			},
		}
		canModify, _ := CanModifyFilterBucket(filters)
		assert.False(t, canModify)
	})

	t.Run("non-modifiable comparator - like", func(t *testing.T) {
		filters := []*taskFilter{
			{
				field:      "labels",
				comparator: taskFilterComparatorLike,
				value:      "test",
			},
		}
		canModify, _ := CanModifyFilterBucket(filters)
		assert.False(t, canModify)
	})

	t.Run("multiple modifiable filters", func(t *testing.T) {
		filters := []*taskFilter{
			{
				field:      "priority",
				comparator: taskFilterComparatorEquals,
				value:      int64(3),
			},
			{
				field:      "done",
				comparator: taskFilterComparatorEquals,
				value:      false,
			},
		}
		canModify, mods := CanModifyFilterBucket(filters)
		assert.True(t, canModify)
		assert.Len(t, mods, 2)
	})

	t.Run("mixed filters - one non-modifiable", func(t *testing.T) {
		filters := []*taskFilter{
			{
				field:      "priority",
				comparator: taskFilterComparatorEquals,
				value:      int64(3),
			},
			{
				field:      "project_id",
				comparator: taskFilterComparatorEquals,
				value:      int64(1),
			},
		}
		canModify, _ := CanModifyFilterBucket(filters)
		assert.False(t, canModify)
	})

	t.Run("empty filters", func(t *testing.T) {
		filters := []*taskFilter{}
		canModify, mods := CanModifyFilterBucket(filters)
		assert.True(t, canModify)
		assert.Len(t, mods, 0)
	})
}

func TestCheckBucketConfigurationDraggable(t *testing.T) {
	t.Run("draggable - all modifiable filters", func(t *testing.T) {
		config := []*ProjectViewBucketConfiguration{
			{
				Title: "Low Priority",
				Filter: &TaskCollection{
					Filter: "priority = 1",
				},
			},
			{
				Title: "High Priority",
				Filter: &TaskCollection{
					Filter: "priority = 5",
				},
			},
		}
		assert.True(t, CheckBucketConfigurationDraggable(config))
	})

	t.Run("draggable - empty filter bucket", func(t *testing.T) {
		config := []*ProjectViewBucketConfiguration{
			{
				Title: "All Tasks",
				Filter: &TaskCollection{
					Filter: "",
				},
			},
		}
		assert.True(t, CheckBucketConfigurationDraggable(config))
	})

	t.Run("draggable - nil filter", func(t *testing.T) {
		config := []*ProjectViewBucketConfiguration{
			{
				Title:  "All Tasks",
				Filter: nil,
			},
		}
		assert.True(t, CheckBucketConfigurationDraggable(config))
	})

	t.Run("not draggable - non-modifiable filter", func(t *testing.T) {
		config := []*ProjectViewBucketConfiguration{
			{
				Title: "Project 1 Tasks",
				Filter: &TaskCollection{
					Filter: "project_id = 1",
				},
			},
		}
		assert.False(t, CheckBucketConfigurationDraggable(config))
	})

	t.Run("not draggable - greater than comparator", func(t *testing.T) {
		config := []*ProjectViewBucketConfiguration{
			{
				Title: "High Priority",
				Filter: &TaskCollection{
					Filter: "priority > 3",
				},
			},
		}
		assert.False(t, CheckBucketConfigurationDraggable(config))
	})

	t.Run("not draggable - mixed with one non-modifiable", func(t *testing.T) {
		config := []*ProjectViewBucketConfiguration{
			{
				Title: "Low Priority",
				Filter: &TaskCollection{
					Filter: "priority = 1",
				},
			},
			{
				Title: "Project 1 Tasks",
				Filter: &TaskCollection{
					Filter: "project_id = 1",
				},
			},
		}
		assert.False(t, CheckBucketConfigurationDraggable(config))
	})

	t.Run("empty configuration", func(t *testing.T) {
		config := []*ProjectViewBucketConfiguration{}
		assert.False(t, CheckBucketConfigurationDraggable(config))
	})
}
