# @param {Integer[][]} triangle
# @return {Integer}
def minimum_total(triangle)
  min = triangle.map { |line| line[0] }.sum
end

p minimum_total([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]])
p minimum_total([[-10]])
