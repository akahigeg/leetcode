# @param {Integer} n
# @param {Integer} k
# @return {Integer}

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
