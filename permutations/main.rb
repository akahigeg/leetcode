# @param {Integer[]} nums
# @return {Integer[][]}

# Rubyのpermutationを使った方法
#
# Runtime: 225 ms, faster than 5.26% of Ruby online submissions for Permutations.
# Memory Usage: 210.9 MB, less than 97.37% of Ruby online submissions for Permutations.
def permute_ruby(nums)
  nums.permutation.to_a
end

# ref: https://leetcode.com/problems/permutations/discuss/573302/Ruby-or-Swap
# 
# Runtime: 162 ms, faster than 71.93% of Ruby online submissions for Permutations.
# Memory Usage: 211.1 MB, less than 55.26% of Ruby online submissions for Permutations.
def permute(nums)
  find_permutation(nums)
end

def find_permutation(nums, answer = [], start = 0)
  return answer << nums.dup if start == nums.size

  (start...nums.size).each do |current|
    nums[start], nums[current] = nums[current], nums[start]
    find_permutation(nums, answer, start+1)
    nums[start], nums[current] = nums[current], nums[start]
  end

  answer
end


p permute([0,1])
p permute([1,2,3])
p permute([1,2,3,4])
p permute([1])