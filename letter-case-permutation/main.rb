# @param {String} s
# @return {String[]}

# Runtime: 161 ms, faster than 50.00% of Ruby online submissions for Letter Case Permutation.
# Memory Usage: 213 MB, less than 70.00% of Ruby online submissions for Letter Case Permutation.
def letter_case_permutation(s)
  return [s] if s.downcase == s.upcase
  result = []
  find_permutation(s, 0, result)

  result
end

def find_permutation(s, position = 0, result)
  while s[position] =~ /[0-9]/
    position += 1
  end

  if position == s.size
    result << s.clone
    return
  end

  lchars = s.clone
  lchars[position] = lchars[position].downcase
  find_permutation(lchars, position + 1, result)

  uchars = s.clone
  uchars[position] = uchars[position].upcase
  find_permutation(uchars, position + 1, result)
end

p letter_case_permutation("a1b")
p letter_case_permutation("c")
p letter_case_permutation("a1b2")
p letter_case_permutation("3z4")
p letter_case_permutation("12345")
