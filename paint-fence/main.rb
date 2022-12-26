# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def num_ways(n, k)
  # n < k の場合はすべての色を使う必要はない

  @post_count = n
  @colors = (0...k).to_a
  @patterns = []

  paint_post

  p @patterns

  @patterns.size
end

def paint_post(painted_posts = [])
  if @post_count == painted_posts.size
    @patterns << painted_posts.clone if painted_posts.uniq.sort == @colors
    return
  end

  @colors.each do |color|
    next if painted_posts[-2..] == [color, color]

    painted_posts << color
    paint_post(painted_posts)
    painted_posts.pop
    # end
  end
end

# p num_ways(3, 2)
# p num_ways(3, 3)
# p num_ways(7, 2)
p num_ways(1, 2)
p num_ways(2, 2)
