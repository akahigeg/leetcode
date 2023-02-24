# @param {Integer[]} nums
# @return {Integer}

# Runtime: 88 ms, faster than 41.51% of Ruby online submissions for Find Peak Element.
# Memory Usage: 211.4 MB, less than 11.32% of Ruby online submissions for Find Peak Element.
def find_peak_element(nums)
  nums.index(nums.max)
end

p find_peak_element([1, 2, 3, 1])
p find_peak_element([1, 2, 1, 3, 5, 6, 4])
