# @param {String} s
# @return {Integer}

# Runtime: 84 ms, faster than 92.45% of Ruby online submissions for Length of Last Word.
# Memory Usage: 210.9 MB, less than 83.40% of Ruby online submissions for Length of Last Word.
def length_of_last_word(s)
  s.split.last.size
  # s.strip.split(" ").last.size
end

p length_of_last_word("Hello world")
p length_of_last_word("  fly me  to  the moon  ")
p length_of_last_word("luffy is still joyboy")

