# @param {Integer[][]} grid
# @return {Integer}

# ref: https://leetcode.com/problems/rotting-oranges/submissions/
# Runtime: 107 ms, faster than 58.02% of Ruby online submissions for Rotting Oranges.
# Memory Usage: 211.1 MB, less than 55.56% of Ruby online submissions for Rotting Oranges.
def oranges_rotting(grid)
  fresh_orange_count = 0
  queue = []

  grid.size.times do |y|
    grid[y].size.times do |x|
      fresh_orange_count += 1 if grid[y][x] == 1
      queue << [y, x] if grid[y][x] == 2
    end
  end

  queue << [-1, -1]
  minutes = -1

  directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
  until queue.empty?
    y, x = queue.shift

    if y == -1
      minutes += 1
      queue << [-1, -1] unless queue.empty?
    else
      directions.each do |dy, dx|
        ny = y + dy
        nx = x + dx
        next if ny.negative? || nx.negative? || ny >= grid.size || nx >= grid[0].size
        next if grid[ny][nx] != 1

        grid[ny][nx] = 2
        fresh_orange_count -= 1
        queue << [ny, nx]
      end
    end
  end

  fresh_orange_count == 0 ? minutes : -1
end

p oranges_rotting([[2, 1, 1], [1, 1, 0], [0, 1, 1]])
p oranges_rotting([[2, 1, 1], [0, 1, 1], [1, 0, 1]])
