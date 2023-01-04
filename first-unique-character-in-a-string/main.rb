# @param {String} s
# @return {Integer}

# Runtime: 678 ms, faster than 50.00% of Ruby online submissions for First Unique Character in a String.
# Memory Usage: 217 MB, less than 45.35% of Ruby online submissions for First Unique Character in a String.
#
# whileにしたバージョンのパフォーマンス
# Runtime: 364 ms, faster than 80.23% of Ruby online submissions for First Unique Character in a String.
# Memory Usage: 212.3 MB, less than 81.40% of Ruby online submissions for First Unique Character in a String.
def first_uniq_char(s)
  uniq_positions = {}

  ## Array::each is more readable than while
  # s.chars.each_with_index do |c, i|
  #   unless uniq_positions[c]
  #     uniq_positions[c] = i
  #   else
  #     uniq_positions[c] = Float::INFINITY
  #   end
  # end

  # while is typically faster than Array::each
  i = 0
  while i < s.size
    unless uniq_positions[s[i]]
      uniq_positions[s[i]] = i
    else
      uniq_positions[s[i]] = Float::INFINITY
    end
    i += 1
  end

  first_uniq_position = uniq_positions.values.min

  first_uniq_position == Float::INFINITY ? -1 : first_uniq_position
end

p first_uniq_char("leetcode")
p first_uniq_char("laveleetcode")
p first_uniq_char("aabb")
