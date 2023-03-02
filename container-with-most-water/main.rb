# @param {Integer[]} height
# @return {Integer}

# Time Limit Exceeded
def max_area(height)
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
