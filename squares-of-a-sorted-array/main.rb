# @param {Integer[]} nums
# @return {Integer[]}

# Runtime: 153 ms, faster than 89.41% of Ruby online submissions for Squares of a Sorted Array.
# Memory Usage: 213.9 MB, less than 24.71% of Ruby online submissions for Squares of a Sorted Array.
def sorted_squares(nums)
  nums.map { |n| n ** 2 }.sort
end

p sorted_squares([-4, -1, 0, 3, 10])
