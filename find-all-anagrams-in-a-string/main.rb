# @param {String} s
# @param {String} p
# @return {Integer[]}

class String
end

# ref: https://leetcode.com/problems/find-all-anagrams-in-a-string/solution/
# Runtime: 186 ms, faster than 85.21% of Ruby online submissions for Find All Anagrams in a String.
# Memory Usage: 212.5 MB, less than 50.00% of Ruby online submissions for Find All Anagrams in a String.
def find_anagrams(s, p)
  return [] if s.size < p.size

  indexes = []

  p_count = [0] * 26
  current_count = [0] * 26

  p.each_char do |c|
    p_count[i_of(c)] += 1
  end

  i = 0
  while i < s.size
    current_count[i_of(s[i])] += 1

    if i >= p.size
      current_count[i_of(s[i - p.size])] -= 1
    end

    if p_count == current_count
      indexes << i - p.size + 1
    end

    i += 1
  end

  indexes
end

def i_of(char)
  char.ord - "a".ord
end

# ref: https://leetcode.com/problems/find-all-anagrams-in-a-string/discuss/982117/Ruby-Sliding-window-O(n)
# Runtime: 183 ms, faster than 85.92% of Ruby online submissions for Find All Anagrams in a String.
# Memory Usage: 212.2 MB, less than 90.14% of Ruby online submissions for Find All Anagrams in a String.
def find_anagrams_with_hashmap(s, p)
  start_indexes = []

  p_chars_counter = Hash.new(0)
  p.each_char do |c|
    p_chars_counter[c] += 1
  end

  l = 0
  r = 0

  while r < s.size
    p s[r]
    if p_chars_counter[s[r]] != 0
      p_chars_counter[s[r]] -= 1
      start_indexes << l if r - l == p.size - 1
      r += 1
    elsif l == r
      l += 1
      r += 1
    else
      p_chars_counter[s[l]] += 1
      l += 1
    end
  end

  p p_chars_counter

  start_indexes
end

p find_anagrams("cbaebabacd", "abc") # => [0,6]
p find_anagrams("abab", "ab") # => [0,1,2]
