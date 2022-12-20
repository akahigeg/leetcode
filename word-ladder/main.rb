# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}

# 自前の実装
# 途中で抜けちゃうので最短が求まらない
def ladder_length(begin_word, end_word, word_list)
  return 0 unless word_list.include?(end_word)

  @count = 1
  @finish = false

  # hit x cog
  # cog
  #  1文字だけ違う dog, log
  #  1文字共通 hot, dot, lot
  # hit
  #  1文字だけ違う hot
  #  1文字共通 dot, lot
  # 1文字だけ違うやつに変化できる
  # 2文字以上違うものは候補から外れる
  forward(begin_word, end_word, word_list, @count)

  if @finish
    @count
  else
    0
  end
end

def forward(current_word, end_word, word_list, count = 0)
  if current_word == end_word
    @count = count
    @finish = true
  end

  return if @finish

  word_list.each do |word|
    diff_count = 0
    current_word.size.times do |i|
      diff_count += 1 if current_word[i] != word[i]
    end

    if diff_count == 1
      remain_word_list = word_list.clone
      remain_word_list.delete(word)

      forward(word, end_word, remain_word_list, count + 1)
    end
  end
end

p ladder_length("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"])
p ladder_length("hit", "cog", ["hot", "dot", "dog", "lot", "log"])
