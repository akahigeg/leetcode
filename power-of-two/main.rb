# @param {Integer} n
# @return {Boolean}

# Runtime: 98 ms, faster than 56.60% of Ruby online submissions for Power of Two.
# Memory Usage: 211 MB, less than 49.06% of Ruby online submissions for Power of Two.
def my_is_power_of_two(n)
  n.to_s(2) =~ /\A10*\Z/ ? true : false
end

# ref: https://leetcode.com/problems/power-of-two/solution/
# Runtime: 71 ms, faster than 98.11% of Ruby online submissions for Power of Two.
# Memory Usage: 211.1 MB, less than 11.32% of Ruby online submissions for Power of Two.
def is_power_of_two_get_the_rightmost_1_bit(n)
  return false if n == 0
  n & -n == n
end

# Runtime: 88 ms, faster than 71.70% of Ruby online submissions for Power of Two.
# Memory Usage: 211 MB, less than 49.06% of Ruby online submissions for Power of Two.
def is_power_of_two_turn_off_the_rightmost_1_bit(n)
  return false if n == 0
  n & (n - 1) == 0
end

# Runtime: 86 ms, faster than 71.70% of Ruby online submissions for Power of Two.
# Memory Usage: 211 MB, less than 49.06% of Ruby online submissions for Power of Two.
def is_power_of_two(n)
  return false if n == 0
  n | -n == -n
end

p is_power_of_two(1)
p is_power_of_two(16)
p is_power_of_two(3)
