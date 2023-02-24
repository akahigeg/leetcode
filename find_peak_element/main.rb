# @param {Integer[]} nums
# @return {Integer}

# Runtime: 88 ms, faster than 41.51% of Ruby online submissions for Find Peak Element.
# Memory Usage: 211.4 MB, less than 11.32% of Ruby online submissions for Find Peak Element.
def find_peak_element(nums)
  # nums.index(nums.max)
  l = 0
  r = nums.size - 1

  while l < r
    mid = (l + r) / 2
    if (nums[mid] > nums[mid + 1])
      r = mid
    else
      l = mid + 1
    end
  end
  l
end

p find_peak_element([1, 2, 3, 1])
p find_peak_element([1, 2, 1, 3, 5, 6, 4])
p find_peak_element([1, 2, 6, 1, 3, 5, 6, 4, 2])
