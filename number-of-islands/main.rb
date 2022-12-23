# @param {Character[][]} grid
# @return {Integer}

# Runtime 260 ms Beats 71.4%
# Memory 219.4 MB Beats 85.79%
def num_islands(grid)
  queue = []
  count = 0
  (0...grid.size).each do |y|
    (0...grid[0].size).each do |x|
      if grid[y][x] == "1"
        queue << [y, x]
        until queue.empty?
          qy, qx = queue.shift
          next if grid[qy][qx] != "1"

          [[qy + 1, qx], [qy - 1, qx], [qy, qx + 1], [qy, qx - 1]].each do |yy, xx|
            next if yy.negative? || xx.negative? || grid[yy].nil? || grid[yy][xx].nil?

            queue << [yy, xx] if grid[yy][xx] == "1"
          end

          grid[qy][qx] = "-1"
        end

        count += 1
      end
    end
  end

  count
end

# 自力で解けず
def my_num_islands(grid)
  queue = []
  visited = {}
  islands = []
  count = 0
  x = 0
  y = 0

  while grid[y][x]
    # p "x: #{x}, y: #{y}"
    if visited["#{y}-#{x}"]
      if y < grid.size
        x += 1
      else
        x = 0
        y += 1
      end
      next
    end

    if grid[y][x] == "1"
      island = []
      queue << [y, x]
      until queue.empty?
        p queue.size
        yy, xx = queue.shift
        island << [xx, yy]
        # p "xx: #{xx}, yy: #{yy}, val: #{grid[xx][yy]}"
        next if xx.nil? || yy.nil? || visited["#{xx}-#{yy}"]

        [[xx - 1, yy], [xx + 1, yy], [xx, yy - 1], [xx, yy + 1]].each do |xxyy|
          next if visited["#{xxyy[0]}-#{xxyy[1]}"]
          if grid[xxyy[0]] && grid[xxyy[0]][xxyy[1]] && grid[xxyy[0]][xxyy[1]] == "1"
            queue << xxyy
          end
        end

        visited["#{xx}-#{yy}"] = true
      end

      p "find island!"

      islands << island
      count += 1
    end

    if y < grid.size
      x += 1
    else
      x = 0
      y += 1
    end

    # p "loop x: #{x}, y: #{y}"
  end

  p islands
  p islands.count

  count
end

p num_islands([["1", "1", "0", "1", "0", "1", "1"]])

p num_islands(
  [
    ["1", "1", "1", "1", "0"],
    ["1", "1", "0", "1", "0"],
    ["1", "1", "0", "0", "0"],
    ["0", "0", "0", "0", "0"],
  ]
)

p num_islands(
  [
    ["1", "1", "0", "0", "0"],
    ["1", "1", "0", "0", "0"],
    ["0", "0", "1", "0", "0"],
    ["0", "0", "0", "1", "1"],
  ]
)

p num_islands(
  [
    ["0", "1", "0", "0", "0"],
    ["1", "1", "1", "1", "0"],
    ["0", "1", "0", "1", "0"],
    ["0", "0", "0", "1", "1"],
  ]
)
