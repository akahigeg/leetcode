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

# Runtime: 100 ms, faster than 88.33% of Ruby online submissions for The K Weakest Rows in a Matrix.
# Memory Usage: 212.5 MB, less than 56.67% of Ruby online submissions for The K Weakest Rows in a Matrix.
#
# 時間計算量がO(mn) 領域計算量がO(1)
# データが小さいので差がでないのかな
def k_weakest_rows_vertical_search(mat, k)
  line = 0
  weakers = []
  Kernel.loop do
    is_last_line = mat[0][line + 1].nil?

    (0..(mat.size - 1)).each do |row|
      if mat[row][line] == 0 && (line == 0 || mat[row][line - 1] != 0)
        weakers.push(row)
      end
    end

    break if weakers.size >= k

    line += 1

    if is_last_line && weakers.size < k
      (0..(mat.size - 1)).each do |row|
        weakers.push(row) unless weakers.include?(row)
      end

      break
    end
  end

  weakers[0..(k - 1)]
end

matrix = [
  [1, 1, 0, 0, 0],
  [1, 1, 1, 1, 0],
  [1, 0, 0, 0, 0],
  [1, 1, 0, 0, 0],
  [1, 1, 1, 1, 1],
]

p k_weakest_rows(matrix, 3)
p k_weakest_rows_vertical_search(matrix, 3)

matrix = [[1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1]]
p k_weakest_rows_vertical_search(matrix, 1)

matrix = [[1, 0, 0, 0], [1, 1, 1, 1], [1, 0, 0, 0], [1, 0, 0, 0]]
p k_weakest_rows_vertical_search(matrix, 2)

matrix = [[1, 0], [0, 0], [1, 0]]
p k_weakest_rows_vertical_search(matrix, 2)
