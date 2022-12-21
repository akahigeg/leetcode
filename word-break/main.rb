# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(s, word_dict)
  length = s.size

  word_dict.each do |word|
    word_dict.each do |word2|
      return true if word + word2 == s
    end
  end

  false
end

p word_break("leetcode", ["leet", "code"])
p word_break("applepenapple", ["apple", "pen"])
