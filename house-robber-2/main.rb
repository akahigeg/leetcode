# @param {Integer[]} nums
# @return {Integer}

# Runtime 80 ms Beats 89.19%
# Memory 211 MB Beats 54
def rob(nums)
  return 0 if nums.size == 0 || nums.nil?
  return nums[0] if nums.size == 1

  memo1 = {}
  amount1 = rob_from(0, nums[1..], memo1)

  memo2 = {}
  amount2 = rob_from(0, nums[0...(nums.size - 1)], memo2)

  [amount1, amount2].max
end

def rob_from(i, nums, memo)
  return 0 if i >= nums.size

  return memo[i] if memo[i]

  sum = [rob_from(i + 1, nums, memo), rob_from(i + 2, nums, memo) + nums[i]].max
  memo[i] = sum
end

# メモ化しない場合
# Runtime 102 ms Beats 83.78%
# Memory 210.9 MB Beats 86.49%

p rob([2, 3, 2])
p rob([1, 2, 3, 1])
p rob([1, 2, 3])
