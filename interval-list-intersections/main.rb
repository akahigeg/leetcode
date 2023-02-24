# @param {Integer[][]} first_list
# @param {Integer[][]} second_list
# @return {Integer[][]}

# Runtime: 110 ms, faster than 100.00% of Ruby online submissions for Interval List Intersections.
# Memory Usage: 211.2 MB, less than 94.44% of Ruby online submissions for Interval List Intersections.
def interval_intersection(first_list, second_list)
  intersections = []

  i = 0
  j = 0

  while i < first_list.size && j < second_list.size
    lo = [first_list[i][0], second_list[j][0]].max
    hi = [first_list[i][1], second_list[j][1]].min
    if lo <= hi
      intersections.push([lo, hi])
    end

    if first_list[i][1] < second_list[j][1]
      i += 1
    else
      j += 1
    end
  end

  intersections
end

p interval_intersection([[0, 2], [5, 10], [13, 23], [24, 25]], [[1, 5], [8, 12], [15, 24], [25, 26]])
p interval_intersection([[1, 3], [5, 6]], [])
