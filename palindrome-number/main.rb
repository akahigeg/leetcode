# @param {Integer} x
# @return {Boolean}

# Runtime: 228 ms, faster than 48.57% of Ruby online submissions for Palindrome Number.
# Memory Usage: 210.9 MB, less than 83.19% of Ruby online submissions for Palindrome Number.
def is_palindrome(x)
  return false if x.negative?

  x.to_s == x.to_s.reverse
end

p is_palindrome(121)
p is_palindrome(-121)
p is_palindrome(10)