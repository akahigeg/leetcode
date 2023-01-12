# @param {String} s1
# @param {String} s2
# @return {Boolean}

# Runtime: 163 ms, faster than 76.79% of Ruby online submissions for Permutation in String.
# Memory Usage: 211 MB, less than 96.43% of Ruby online submissions for Permutation in String.
def check_inclusion(s1, s2)
  return false if s1.size > s2.size

  s1_counter = Array.new(26, 0)
  s2_counter = Array.new(26, 0)

  i = 0
  while i < s1.size
    char1 = s1[i]
    s1_counter[char_ord(char1)] += 1

    char2 = s2[i]
    s2_counter[char_ord(char2)] += 1

    i += 1
  end

  while i < s2.size
    return true if s1_counter == s2_counter

    shifted_char_in_window = s2[i - s1.size]
    s2_counter[char_ord(shifted_char_in_window).ord] -= 1

    pushed_char_in_window = s2[i]
    s2_counter[char_ord(pushed_char_in_window)] += 1

    i += 1
  end

  # p "#{s1_counter} == #{s2_counter}"

  s1_counter == s2_counter
end

def char_ord(char)
  char.ord - "a".ord
end

p check_inclusion("ab", "eidbaooo")
p check_inclusion("ab", "eidboaoo")
p check_inclusion("adc", "dcda")
