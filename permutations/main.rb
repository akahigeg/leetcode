# @param {Integer[]} nums
# @return {Integer[][]}

# Rubyのpermutationを使った方法
#
# Runtime: 225 ms, faster than 5.26% of Ruby online submissions for Permutations.
# Memory Usage: 210.9 MB, less than 97.37% of Ruby online submissions for Permutations.
def permute_ruby(nums)
  nums.permutation.to_a
end

def permute(nums)
  find_permutation(nums)
end

def find_permutation(nums, answer = [], combination = [], start = 0)
  
end


# p permute([0,1])
p permute([1,2,3,4])
# p permute([1])