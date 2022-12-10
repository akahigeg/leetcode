# @param {Integer} m
# @param {Integer} n
# @return {Integer}

# Runtime 84 ms Beats 95.71%
# Memory 211.3 MB Beats 17.14%
def unique_paths(m, n)
  grid = []
  (0...m).each do |i|
    (0...n).each do |j|
      grid[i] ||= []

      if i == 0 || j == 0
        grid[i][j] = 1
        next
      end

      above = grid[i - 1] && grid[i - 1][j]
      left = grid[i] && grid[i][j - 1]
      grid[i][j] = above + left
    end
  end

  grid[m - 1][n - 1]
end

# Time Limit Exceeded
def unique_paths_tle_2(m, n)
  return 1 if m == 1 || n == 1

  unique_paths(m - 1, n) + unique_paths(m, n - 1)
end

# Time Limit Exceeded
def unique_paths_tle(m, n)
  @can_down = m - 1
  @can_right = n - 1
  @can_move = @can_down + @can_right
  @path_count = 0

  move_to(0, 0)

  @path_count
end

def move_to(down, right)
  # p "#{down}, #{right}"
  @path_count += 1 if down + right == @can_move
  move_to(down + 1, right) if down < @can_down
  move_to(down, right + 1) if right < @can_right
end

p unique_paths(3, 7) # => 28
p unique_paths(3, 2) # => 3
p unique_paths(1, 1) # => ?
p unique_paths(2, 1) # => 1
p unique_paths(1, 2) # => 1
p unique_paths(2, 2) # => 2
p unique_paths(3, 3) # => 6
