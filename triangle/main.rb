# @param {Integer[][]} triangle
# @return {Integer}

# ref: https://leetcode.com/problems/triangle/solution/
# Runtime: 149 ms, faster than 40.74% of Ruby online submissions for Triangle.
# Memory Usage: 214.5 MB, less than 7.41% of Ruby online submissions for Triangle.
def minimum_total(triangle)
  @sums = {} # #{line}-#{col}

  sum(triangle, 0, 0)
end

def sum(triangle, line, col)
  return @sums["#{line}-#{col}"] if @sums["#{line}-#{col}"]

  path = triangle[line][col]

  if line < triangle.size - 1
    path += [sum(triangle, line + 1, col),
             sum(triangle, line + 1, col + 1)].min
    @sums["#{line}-#{col}"] = path
  end

  path
end

p minimum_total([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]])
p minimum_total([[2], [3, 4], [1, 99, 99], [300, 299, 400, 100]])
p minimum_total([[-10]])
