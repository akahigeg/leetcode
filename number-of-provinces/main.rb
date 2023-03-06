# @param {Integer[][]} is_connected
# @return {Integer}

# Runtime: 96 ms, faster than 89.19% of Ruby online submissions for Number of Provinces.
# Memory Usage: 213.9 MB, less than 45.95% of Ruby online submissions for Number of Provinces.
def find_circle_num(is_connected)
  @connections = is_connected
  @visited = Array.new(@connections.size, 0)

  count = 0

  @connections.each_with_index do |row, i|
    if @visited[i] == 0
      dfs(i)
      count += 1
    end
  end

  count
end

def dfs(i)
  j = 0
  while j < @connections.size
    if (@connections[i][j] == 1 && @visited[j] == 0)
      @visited[j] = 1
      dfs(j)
    end
    j += 1
  end
end

p find_circle_num([[1, 1, 0], [1, 1, 0], [0, 0, 1]]) # => 2
p find_circle_num([[1, 0, 0], [0, 1, 0], [0, 0, 1]]) # => 3
p find_circle_num([[1, 1, 0, 0], [1, 1, 0, 1], [0, 0, 1, 0], [0, 1, 0, 1]]) # => 2
