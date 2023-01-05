# @param {Integer[][]} grid
# @return {Integer}
def max_area_of_island(grid)
  p "size: #{grid[0].size} * #{grid.size}"

  y = 0
  while y < grid.size
    x = 0
    line = []
    while x < grid[0].size
      line << grid[y][x]
      x += 1
    end
    p line
    y += 1
  end
end

p max_area_of_island([[0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0], [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0], [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0]]) #=> 6
p max_area_of_island([[0, 0, 0, 0, 0, 0, 0, 0]]) #=> 0
