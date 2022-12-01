# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}

# バイナリサーチ
# ref: https://leetcode.com/problems/search-in-rotated-sorted-array/discuss/2819212/Ruby-one-approach
#
# Runtime: 159 ms, faster than 30.90% of Ruby online submissions for Search in Rotated Sorted Array.
# Memory Usage: 211.1 MB, less than 55.62% of Ruby online submissions for Search in Rotated Sorted Array.
def search(nums, target)
  left = 0
  right = nums.size - 1

  while left <= right
    center = right + 1 / 2
    return center if nums[center] == target

    if nums[left] <= nums[center]
      # 左側
      if target > nums[center] || target < nums[left]
        left = center + 1
      else
        right = center - 1
      end
    else
      # 右側
      if target < nums[center] || target > nums[right]
        right = center - 1
      else
        left = center + 1
      end
    end
  end

  -1
end

# Rubyのfind_indexがすでに速い
#
#Runtime: 80 ms, faster than 89.89% of Ruby online submissions for Search in Rotated Sorted Array.
# Memory Usage: 211 MB, less than 85.39% of Ruby online submissions for Search in Rotated Sorted Array.
def search_by_find_index(nums, target)
  index = nums.find_index(target)
  index.nil? ? -1 : index
end

p search([4, 5, 6, 7, 0, 1, 2], 0)
p search([4, 5, 6, 7, 0, 1, 2], 3)
