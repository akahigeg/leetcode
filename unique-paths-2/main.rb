# @param {Integer[][]} obstacle_grid
# @return {Integer}

# Runtime 71 ms Beats 94.74%
# Memory 211.3 MB Beats 5.26%
def unique_paths_with_obstacles(obstacle_grid)
  og = obstacle_grid # 変数名を短く
  r = og.size
  c = og[0].size

  # スタート地点に障害物があったらそこで終了（ゴールにはたどり着けない）
  return 0 if og[0][0] == 1

  og[0][0] = 1

  # 最初の列を埋める どこかの行がふさがっていたら以降の行にも到達できない
  (1...r).each do |i|
    og[i][0] = (og[i][0] == 0 && og[i - 1][0] == 1) ? 1 : 0
  end

  # 最初の行を埋める どこかの列がふさがっていたら以降の列にも到達できない
  (1...c).each do |i|
    og[0][i] = (og[0][i] == 0 && og[0][i - 1] == 1) ? 1 : 0
  end

  (1...r).each do |i|
    (1...c).each do |j|
      if og[i][j] == 0
        og[i][j] = og[i - 1][j] + og[i][j - 1]
      else
        og[i][j] = 0
      end
    end
  end

  og.last.last
end

# 自前実装したやつ 閉路を判定できず
def unique_paths_with_obstacles_ng(obstacle_grid)
  m = obstacle_grid.size
  n = obstacle_grid[0].size

  # スタート地点に障害物があったらそこで終了（ゴールにはたどり着けない）
  return 0 if obstacle_grid[0][0] == 1

  grid = []
  (0...m).each do |i|
    grid[i] ||= []
    (0...n).each do |j|
      if obstacle_grid[i][j] == 1
        grid[i][j] = 0
        next
      end

      if i == 0 || j == 0
        grid[i][j] = 1
        next
      end

      above = grid[i - 1][j]
      left = grid[i][j - 1]

      grid[i][j] = above + left
    end
  end

  # p obstacle_grid
  # p grid

  # 全て0の列があればゴールにはたどり着けない
  return 0 unless grid.select { |row| row.sum == 0 }.empty?

  (0...grid[0].size).each do |i|
    return 0 if grid.map { |row| row[i] }.sum == 0
  end

  grid.last.last
end

p unique_paths_with_obstacles([[0, 0, 0], [0, 1, 0], [0, 0, 0]])
p unique_paths_with_obstacles([[0, 0, 0], [0, 1, 0], [0, 0, 0], [0, 0, 0]])
p unique_paths_with_obstacles([[0, 1], [0, 0]])
# p unique_paths_with_obstacles([[0, 0], [0, 1]])
# p unique_paths_with_obstacles([[1, 0]])
# p unique_paths_with_obstacles([[0, 0], [1, 1], [0, 0]])
# p unique_paths_with_obstacles([[0, 0], [0, 1], [1, 0]])
# p unique_paths_with_obstacles([[0, 0], [0, 1], [1, 0], [0, 0]])
