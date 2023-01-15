# @param {Integer[][]} mat
# @return {Integer[][]}
require "set"

# ref: https://leetcode.com/problems/01-matrix/discuss/1011326/Ruby-Solution-BFS
# Runtime: 921 ms, faster than 48.89% of Ruby online submissions for 01 Matrix.
# Memory Usage: 216.3 MB, less than 11.11% of Ruby online submissions for 01 Matrix.
def update_matrix(mat)
  visited = Set.new
  queue = []
  mat.size.times do |i|
    mat[0].size.times do |j|
      if mat[i][j] == 0
        visited.add([i, j])
        queue.push([i, j])
      end
    end
  end

  directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]

  while !queue.empty?
    i, j = queue.shift
    directions.each do |x, y|
      dx = i + x
      dy = j + y
      if dx >= 0 && dy >= 0 && dx < mat.size && dy < mat[0].size && !visited.include?([dx, dy])
        visited.add([dx, dy])
        queue << [dx, dy]
        mat[dx][dy] = mat[i][j] + 1
      end
    end
  end
  mat
end

p update_matrix([[1, 1, 1, 0]])
p update_matrix([[0, 0, 0], [0, 1, 0], [0, 0, 0]])
p update_matrix([[0, 0, 0], [0, 1, 0], [1, 1, 1]])
p update_matrix([[0, 0, 0], [0, 1, 0], [1, 1, 1], [1, 1, 1]])
