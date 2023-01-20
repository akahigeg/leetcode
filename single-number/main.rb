# @param {Integer[]} nums
# @return {Integer}

# Runtime: 107 ms, faster than 57.56% of Ruby online submissions for Single Number.
# Memory Usage: 212.6 MB, less than 62.21% of Ruby online submissions for Single Number.
def single_number(nums)
  nums.sort!
  i = 0
  while i < nums.size
    return nums[i] if nums[i] != nums[i + 1]
    i += 2
  end
end

p single_number([2, 2, 1])
p single_number([4, 1, 2, 2, 1])
p single_number([1])
