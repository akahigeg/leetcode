# @param {Integer[][]} grid
# @return {Integer}
def max_area_of_island(grid)
  max_area = 0
  stack = []

  y = 0
  while y < grid.size
    x = 0
    while x < grid[0].size
      current_area = search_island([y, x], 0, grid)

      max_area = [max_area, current_area].max
      x += 1
    end
    y += 1
  end

  max_area
end

def search_island(from, current_area, grid)
  y, x = from
  return current_area if grid[y].nil? || grid[y][x].nil? || grid[y][x] != 1

  grid[y][x] = 0
  current_area += 1

  [[y + 1, x], [y - 1, x], [y, x + 1], [y, x - 1]].each do |yx|
    current_area = search_island(yx, current_area, grid) unless yx[0].negative? && yx[1].negative?
  end

  current_area
end

p max_area_of_island([[1, 0, 0, 0, 0, 0, 0, 0]]) #=> 0
p max_area_of_island([[1, 1, 0, 0, 1, 0, 0, 0]]) #=> 0
p max_area_of_island([[1, 1, 0, 0, 1, 1, 1, 0]]) #=> 0
p max_area_of_island([
    [1, 1, 0, 0, 1, 1, 1, 1],
    [1, 1, 0, 0, 0, 0, 0, 0],
    [1, 1, 0, 0, 1, 1, 1, 0],
  ]) #=> 0

# p max_area_of_island([[0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0], [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0], [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0]]) #=> 6
# p max_area_of_island([[0, 0, 0, 0, 0, 0, 0, 0]]) #=> 0
