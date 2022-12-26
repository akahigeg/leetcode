# @param {Integer} n
# @param {Integer} k
# @return {Integer}

# Runtime 83 ms Beats 100%
# Memory 211 MB Beats 100%
def num_ways(n, k)
  @memo = {}
  total_ways(n, k)
end

def total_ways(i, color_count)
  return color_count if i == 1
  return color_count * color_count if i == 2

  return @memo[i] if @memo[i]

  @memo[i] = (color_count - 1) * (total_ways(i - 1, color_count) + total_ways(i - 2, color_count))
end

# TLE
def my_num_ways(n, k)
  @post_count = n
  @colors = (0...k).to_a
  @patterns = []

  paint_post

  p @patterns

  @patterns.size
end

def paint_post(painted_posts = [])
  if @post_count == painted_posts.size
    # すべての色を使う必要はない
    @patterns << painted_posts.clone # if painted_posts.uniq.sort == @colors
    return
  end

  @colors.each do |color|
    # 同じ数が2つ連続していたら、3連続になってしまうのでもう付け加えない＆そのパターンをそれ以上追う必要はない
    next if painted_posts[-2..] == [color, color]

    painted_posts << color
    paint_post(painted_posts)
    painted_posts.pop
    # end
  end
end

p num_ways(3, 2)
p num_ways(3, 3)
p num_ways(7, 2)
p num_ways(1, 2)
p num_ways(2, 2)
