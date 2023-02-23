# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}

# ref: https://leetcode.com/problems/combinations/?envType=study-plan&id=algorithm-i
# Runtime: 232 ms, faster than 80.00% of Ruby online submissions for Combinations.
# Memory Usage: 215.1 MB, less than 8.00% of Ruby online submissions for Combinations.
def combine(n, k)
  result = []

  backtrack(n, k, 1, [], result)

  result
end

def backtrack(n, k, first_index, current, result)
  if current.size == k
    result << current.clone
    return
  end

  i = first_index
  while i <= n
    current << i
    backtrack(n, k, i + 1, current, result)
    current.pop
    i += 1
  end
end

p combine(4, 2)
p combine(2, 1)
p combine(1, 1)
