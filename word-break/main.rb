# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}

# 自前の実装
# Time Limit Exceeded
def word_break(s, word_dict)
  wb(s, "", s, word_dict)
end

def wb(s, fix_s, remain_s, word_dict)
  # word_dictの中からsと前方一致するものを抜き出す
  candidates = word_dict.filter { |w| remain_s =~ /^#{w}/ }
  # p "fix: '#{fix_s}', remain: #{remain_s}, candidates: [#{candidates.join(", ")}]"
  candidates.each do |word|
    if s == fix_s + word
      return true
    end

    matched = wb(s, fix_s + word, remain_s.slice(word.size, remain_s.size), word_dict)
    return true if matched
  end

  false
end

p word_break("leetcode", ["leet", "code"])
p word_break("applepenapple", ["apple", "pen"])
p word_break("catsandog", ["cats", "dog", "sand", "and", "cat"])
p word_break("cars", ["car", "ca", "rs"])
