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

// ModifiableFilterFields defines which filter fields can be changed through drag & drop
var ModifiableFilterFields = map[string]bool{
	"assignees":    true,
	"labels":       true,
	"label_id":     true,
	"priority":     true,
	"done":         true,
	"percent_done": true,
	"due_date":     true, // only with = comparator
	"start_date":   true, // only with = comparator
	"end_date":     true, // only with = comparator
}

// NonModifiableComparators defines comparators that prevent drag & drop modification
var NonModifiableComparators = map[taskFilterComparator]bool{
	taskFilterComparatorGreater:      true,
	taskFilterComparatorGreateEquals: true,
	taskFilterComparatorLess:         true,
	taskFilterComparatorLessEquals:   true,
	taskFilterComparatorLike:         true,
}

// FilterBucketModification represents a modification to apply when moving a task between filter buckets
type FilterBucketModification struct {
	Field      string      `json:"field"`
	Value      interface{} `json:"value"`
	Comparator string      `json:"comparator"`
}

// CanModifyFilterBucket checks if a bucket filter can be modified through drag & drop
// Returns true if all filters in the bucket are modifiable, along with the list of modifications
func CanModifyFilterBucket(filters []*taskFilter) (bool, []FilterBucketModification) {
	modifications := []FilterBucketModification{}

	for _, f := range filters {
		// Recursively check nested filters
		if nested, is := f.value.([]*taskFilter); is {
			canModify, nestedMods := CanModifyFilterBucket(nested)
			if !canModify {
				return false, nil
			}
			modifications = append(modifications, nestedMods...)
			continue
		}

		// Check if the field is modifiable
		if !ModifiableFilterFields[f.field] {
			return false, nil
		}

		// Check if the comparator is allowed
		if NonModifiableComparators[f.comparator] {
			return false, nil
		}

		modifications = append(modifications, FilterBucketModification{
			Field:      f.field,
			Value:      f.value,
			Comparator: string(f.comparator),
		})
	}

	return true, modifications
}

// CheckBucketConfigurationDraggable checks if all bucket configurations in a view support drag & drop
func CheckBucketConfigurationDraggable(bucketConfiguration []*ProjectViewBucketConfiguration) bool {
	if len(bucketConfiguration) == 0 {
		return false
	}

	for _, bc := range bucketConfiguration {
		if bc.Filter == nil || bc.Filter.Filter == "" {
			// Empty filters are allowed, tasks can be moved into them
			continue
		}

		filters, err := getTaskFiltersFromFilterString(bc.Filter.Filter, bc.Filter.FilterTimezone)
		if err != nil {
			return false
		}

		canModify, _ := CanModifyFilterBucket(filters)
		if !canModify {
			return false
		}
	}

	return true
}
