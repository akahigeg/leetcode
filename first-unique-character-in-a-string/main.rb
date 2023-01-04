# @param {String} s
# @return {Integer}

# Runtime: 678 ms, faster than 50.00% of Ruby online submissions for First Unique Character in a String.
# Memory Usage: 217 MB, less than 45.35% of Ruby online submissions for First Unique Character in a String.
def first_uniq_char(s)
  counts = {}
  s.chars.each_with_index do |c, i|
    unless counts[c]
      counts[c] = i
    else
      counts[c] = Float::INFINITY
    end
  end

  first_uniq_position = counts.values.min

  first_uniq_position == Float::INFINITY ? -1 : first_uniq_position
end

p first_uniq_char("leetcode")
p first_uniq_char("laveleetcode")
p first_uniq_char("aabb")
