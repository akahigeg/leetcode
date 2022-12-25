# @param {Integer[][]} intervals
# @return {Integer}

# Runtime 90 ms Beats 97.44%
# Memory 212.1 MB Beats 64.10%
def min_meeting_rooms(intervals)
  intervals.sort! { |i1, i2| i1[0] <=> i2[0] }

  rooms = []

  i = 0
  while i < intervals.size
    # Heap使わないでいけてるけど効率は悪いか
    rooms.each_with_index do |room, j|
      if room[1] <= intervals[i][0]
        rooms.delete_at(j)
        break
      end
    end
    rooms << intervals[i]

    i += 1
  end

  rooms.size
end

# pointerを使う
# Runtime 90 ms Beats 97.44%
# Memory 212.1 MB Beats 64.10%
def min_meeting_rooms_with_pointer(intervals)
  intervals.sort! { |i1, i2| i1[0] <=> i2[0] }
  start_times = intervals.map { |i| i[0] }.sort
  end_times = intervals.map { |i| i[1] }.sort

  s_pointer = 0
  e_pointer = 0
  count = 0

  while s_pointer < intervals.size
    if start_times[s_pointer] >= end_times[e_pointer]
      e_pointer += 1
      count -= 1
    end
    s_pointer += 1
    count += 1
  end

  count
end

p min_meeting_rooms([[0, 30], [5, 10], [15, 20]])
p min_meeting_rooms([[7, 10], [2, 4]])
p min_meeting_rooms([[1, 13], [13, 15]])
p min_meeting_rooms([[2, 7]])
p min_meeting_rooms([[5, 8], [6, 8]])
p min_meeting_rooms([[0, 100], [1, 99], [1, 9], [10, 11]])
