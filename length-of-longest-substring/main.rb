# @param {String} s
# @return {Integer}

# ref: https://leetcode.com/problems/longest-substring-without-repeating-characters/discuss/283979/Ruby-solution
#
# Runtime: 147 ms, faster than 92.38% of Ruby online submissions for Longest Substring Without Repeating Characters.
# Memory Usage: 211.1 MB, less than 78.67% of Ruby online submissions for Longest Substring Without Repeating Characters.
def length_of_longest_substring_with_queue(s)
  queue = []
  longest = 0
  s.each_char do |char|
    if index = queue.index(char)
      (index + 1).times { queue.shift }
    end
    queue.push(char)
    longest = [queue.length, longest].max
  end
  longest
end

# ref: https://leetcode.com/problems/longest-substring-without-repeating-characters/discuss/269208/3%3A-Ruby-solution
#
# Runtime: 423 ms, faster than 29.52% of Ruby online submissions for Longest Substring Without Repeating Characters.
# Memory Usage: 211.1 MB, less than 57.14% of Ruby online submissions for Longest Substring Without Repeating Characters.
def length_of_longest_substring(s)
  left = right = current_length = longest_length = 0

  while right < s.size
    current_length = right + 1 - left
    longest_length = [current_length, longest_length].max

    return longest_length if s.size - left <= longest_length

    if s[left..right].include?(s[right + 1])
      left += 1
      right += 1 if right < left
    else
      right += 1
    end
  end

  longest_length
end

p length_of_longest_substring("abcabcbb")
p length_of_longest_substring("bbbbb")
p length_of_longest_substring("pwwkew")
p length_of_longest_substring("dvdf")
