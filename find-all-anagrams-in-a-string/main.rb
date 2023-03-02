# @param {String} s
# @param {String} p
# @return {Integer[]}

# ref: https://leetcode.com/problems/find-all-anagrams-in-a-string/discuss/982117/Ruby-Sliding-window-O(n)
# Runtime: 183 ms, faster than 85.92% of Ruby online submissions for Find All Anagrams in a String.
# Memory Usage: 212.2 MB, less than 90.14% of Ruby online submissions for Find All Anagrams in a String.
def find_anagrams(s, p)
  start_indexes = []

  p_chars_counter = Hash.new(0)
  p.each_char do |c|
    p_chars_counter[c] += 1
  end

  head = 0
  tail = 0

  while tail < s.size
    if p_chars_counter[s[tail]] != 0
      p_chars_counter[s[tail]] -= 1
      start_indexes << head if tail - head == p.size - 1
      tail += 1
    elsif head == tail
      head += 1
      tail += 1
    else
      p_chars_counter[s[head]] += 1
      head += 1
    end
  end

  start_indexes
end

p find_anagrams("cbaebabacd", "abc") # => [0,6]
p find_anagrams("abab", "ab") # => [0,1,2]
