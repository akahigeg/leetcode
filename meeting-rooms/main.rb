# @param {Integer[][]} intervals
# @return {Boolean}

# Runtime 102 ms Beats 75.86%
# Memory 211.6 MB Beats 44.83%
def can_attend_meetings(intervals)
  intervals.sort! { |i1, i2| i1[0] <=> i2[0] }

  i = 0
  while i < intervals.size - 1
    if intervals[i][1] > intervals[i + 1][0]
      return false
    end

    i += 1
  end

  true
end

p can_attend_meetings([[0, 30], [5, 10], [15, 20]])
p can_attend_meetings([[7, 10], [2, 4]])
p can_attend_meetings([[13, 15], [1, 13]])
