# @param {String} s
# @return {String}
# Runtime: 87 ms, faster than 88.06% of Ruby online submissions for Reverse Words in a String III.
# Memory Usage: 212.6 MB, less than 52.24% of Ruby online submissions for Reverse Words in a String III.
def reverse_words(s)
  s.split(" ").map { |word| word.reverse }.join(" ")
end

p reverse_words("Let's take LeetCode contest")
