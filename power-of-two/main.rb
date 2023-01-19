# @param {Integer} n
# @return {Boolean}

# Runtime: 98 ms, faster than 56.60% of Ruby online submissions for Power of Two.
# Memory Usage: 211 MB, less than 49.06% of Ruby online submissions for Power of Two.
def is_power_of_two(n)
  n.to_s(2) =~ /\A10*\Z/ ? true : false
end

p is_power_of_two(1)
p is_power_of_two(16)
p is_power_of_two(3)
