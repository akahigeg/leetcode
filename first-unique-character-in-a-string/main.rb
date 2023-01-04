# @param {String} s
# @return {Integer}

# Runtime: 1015 ms, faster than 26.74% of Ruby online submissions for First Unique Character in a String.
# Memory Usage: 217.5 MB, less than 11.63% of Ruby online submissions for First Unique Character in a String.
def first_uniq_char(s)
  counts = {}
  s.split(//).each_with_index do |c, i|
    unless counts[c]
      counts[c] = i
    else
      counts[c] = Float::INFINITY
    end
  end

  first_uniq_position = counts.map { |_, i| i }.min

  first_uniq_position == Float::INFINITY ? -1 : first_uniq_position
end

p first_uniq_char("leetcode")
p first_uniq_char("laveleetcode")
p first_uniq_char("aabb")
