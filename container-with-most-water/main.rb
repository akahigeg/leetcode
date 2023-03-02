# @param {Integer[]} height
# @return {Integer}

# Runtime: 189 ms, faster than 20.12% of Ruby online submissions for Container With Most Water.
# Memory Usage: 217.5 MB, less than 78.05% of Ruby online submissions for Container With Most Water.
def max_area(height)
  r = 0
  l = height.size - 1
  max = 0
  while r < l
    max = [[height[r], height[l]].min * (l - r), max].max
    if height[r] <= height[l]
      r += 1
    else
      l -= 1
    end
  end

  max
end

# Time Limit Exceeded
def max_area_bf(height)
  r = 0
  l = height.size - 1
  max = 0
  while r < height.size - 1
    l = height.size - 1
    while l > 0
      max = [[height[r], height[l]].min * (l - r), max].max
      l -= 1
    end
    r += 1
  end

  max
end

p max_area([1, 8, 6, 2, 5, 4, 8, 3, 7]) # => 49
p max_area([1, 1]) # => 1
