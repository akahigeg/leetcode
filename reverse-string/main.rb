# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
# Runtime: 253 ms, faster than 91.25% of Ruby online submissions for Reverse String.
# Memory Usage: 225.3 MB, less than 98.13% of Ruby online submissions for Reverse String.
def reverse_string(s)
  head = 0
  tail = s.size - 1
  while head < tail
    s[head], s[tail] = s[tail], s[head]

    head += 1
    tail -= 1
  end

  s
end

p reverse_string("hello".chars)
p reverse_string("Hannah".chars)
