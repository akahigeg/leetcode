# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}

# Runtime: 82 ms, faster than 96.90% of Ruby online submissions for Binary Search.
# Memory Usage: 213.9 MB, less than 11.46% of Ruby online submissions for Binary Search.
def search(nums, target)
  lo = 0
  hi = nums.size - 1

  while lo <= hi
    mid = (lo + hi) / 2

    return mid if nums[mid] == target

    if nums[mid] < target
      lo = mid + 1
    else
      hi = mid - 1
    end
  end

  -1
end

p search([-1, 0, 3, 5, 9, 12], 9)
p search([5], 5)
