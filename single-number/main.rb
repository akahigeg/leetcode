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

# Runtime: 98 ms, faster than 76.16% of Ruby online submissions for Single Number.
# Memory Usage: 213.2 MB, less than 52.33% of Ruby online submissions for Single Number.
def single_number_with_mash(nums)
  nums.uniq.sum * 2 - nums.sum
end

def single_number_with_bit_manupilation(nums)
  a = 0
  nums.each do |i|
    a ^= i
  end

  a
end

p single_number([2, 2, 1])
p single_number([4, 1, 2, 2, 1])
p single_number([1])
