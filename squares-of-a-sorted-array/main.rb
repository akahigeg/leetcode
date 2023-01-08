# @param {Integer[]} nums
# @return {Integer[]}

# Runtime: 153 ms, faster than 89.41% of Ruby online submissions for Squares of a Sorted Array.
# Memory Usage: 213.9 MB, less than 24.71% of Ruby online submissions for Squares of a Sorted Array.
def sorted_squares_n_log_n(nums)
  nums.map { |n| n ** 2 }.sort
end

# O(n)
def sorted_squares(nums)
  i = nums.size - 1
  left = 0
  right = i
  result = Array.new(i)

  while i > -1
    if nums[left].abs < nums[right].abs
      num = nums[right]
      right -= 1
    else
      num = nums[left]
      left += 1
    end
    result[i] = num ** 2

    i -= 1
  end

  result
end

p sorted_squares([-4, -1, 0, 3, 10])
