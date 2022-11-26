# @param {Integer[][]} mat
# @param {Integer} k
# @return {Integer[]}

# untime: 108 ms, faster than 83.33% of Ruby online submissions for The K Weakest Rows in a Matrix.
# Memory Usage: 212.5 MB, less than 56.67% of Ruby online submissions for The K Weakest Rows in a Matrix.
def k_weakest_rows(mat, k)
  soldiers = {}
  mat.each_with_index do |row, i|
    soldiers[i] = 0
    row.each do |point|
      break if point == 0
      soldiers[i] += 1
    end
  end

  powers = soldiers.sort { |row1, row2| row1[1] <=> row2[1] }
  answer = powers.map { |row| row[0] }[0..(k - 1)]

  answer
end

matrix = [
  [1, 1, 0, 0, 0],
  [1, 1, 1, 1, 0],
  [1, 0, 0, 0, 0],
  [1, 1, 0, 0, 0],
  [1, 1, 1, 1, 1],
]

p k_weakest_rows(matrix, 3)
