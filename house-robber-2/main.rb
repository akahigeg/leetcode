# @param {Integer[]} nums
# @return {Integer}

# Runtime 102 ms Beats 83.78%
# Memory 210.9 MB Beats 86.49%
def rob(nums)
  return 0 if nums.size == 0 || nums.nil?
  return nums[0] if nums.size == 1

  [rob_from(nums[1..]), rob_from(nums[0...(nums.size - 1)])].max
end

def rob_from(nums)
  t1 = 0
  t2 = 0
  nums.each do |n|
    temp = t1
    t1 = [n + t2, t1].max
    t2 = temp
  end

  t1
end

p rob([2, 3, 2])
p rob([1, 2, 3, 1])
p rob([1, 2, 3])
