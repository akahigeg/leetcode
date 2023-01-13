# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} color
# @return {Integer[][]}

# Runtime: 100 ms, faster than 78.35% of Ruby online submissions for Flood Fill.
# Memory Usage: 211.2 MB, less than 63.92% of Ruby online submissions for Flood Fill.
def flood_fill(image, sr, sc, color)
  # p image[sr][sc]
  visited = {}
  fill_neighbor_pixel(image, sr, sc, image[sr][sc], color, visited)

  image
end

def fill_neighbor_pixel(image, y, x, from_color, to_color, visited)
  # p "sr: #{y}, sc: #{x}, color: #{image[y][x]}"
  return if visited["#{y}-#{x}"]
  return if image[y][x] != from_color # 別の色の場合は何もしない（すでに指定の色になっている場合は何もしない）
  image[y][x] = to_color
  visited["#{y}-#{x}"] = true

  [[y + 1, x], [y - 1, x], [y, x + 1], [y, x - 1]].each do |yy, xx|
    next if xx.negative? || yy.negative? || xx >= image[0].size || yy >= image.size
    fill_neighbor_pixel(image, yy, xx, from_color, to_color, visited)
  end
end

p flood_fill([[6, 2, 3], [4, 6, 6], [7, 8, 9]], 1, 2, 2)
p flood_fill([[1, 1, 1], [1, 1, 0], [1, 0, 1]], 1, 1, 2)
p flood_fill([[0, 0, 0], [0, 0, 0]], 0, 0, 0)
