# @param {Integer} n
# @return {Integer}

# ref: https://leetcode.com/problems/climbing-stairs/solution/
# Approach 2
# Runtime: 86 ms, faster than 69.55% of Ruby online submissions for Climbing Stairs.
# Memory Usage: 211 MB, less than 42.18% of Ruby online submissions for Climbing Stairs.
def climb_stairs(n)
  @memo = []
  climb(0, n)
end

def climb(i, n)
  return 0 if i > n
  return 1 if i == n
  return @memo[i] if @memo[i]
  @memo[i] = climb(i + 1, n) + climb(i + 2, n)

  @memo[i]
end

p climb_stairs(2) # [1,1], [2]
p climb_stairs(3) # [1,1,1], [1,2], [2,1]
p climb_stairs(4) # [1,1,1,1], [1,1,2], [1,2,1], [2,1,1]
p climb_stairs(5) # [1,1,1,1,1], [1,1,1,2], [1,1,2,1], [1,2,1,1], [1,2,2], [2,1,1,1], [2,2,1], [2,1,2]
