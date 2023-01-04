# @param {String} s
# @param {String} t
# @return {Boolean}

# Runtime: 94 ms, faster than 72.04% of Ruby online submissions for Is Subsequence.
# Memory Usage: 211 MB, less than 61.83% of Ruby online submissions for Is Subsequence.
def is_subsequence(s, t)
  return true if s == ""

  i = 0
  j = 0
  while j < t.size
    if s[i] == t[j]
      i += 1
      return true if i == s.size
    end
    j += 1
  end

  false
end

p is_subsequence("abc", "ahbgdc")
p is_subsequence("axc", "ahbgdc")
p is_subsequence("", "ahbgdc")
