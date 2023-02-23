# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

# Runtime: 87 ms, faster than 60.26% of Ruby online submissions for Find First and Last Position of Element in Sorted Array.
# Memory Usage: 212.3 MB, less than 11.54% of Ruby online submissions for Find First and Last Position of Element in Sorted
def search_range(nums, target)
  # 最初の要素を見つける
  first_index = nums.bsearch_index { |n| n >= target }
  if first_index.nil? || nums[first_index] != target
    return [-1, -1]
  end

  last_index = nums.size - 1 - nums.reverse.map { |n| -n }.bsearch_index { |n| n >= -target }

  [first_index, last_index]
end

p search_range([5, 7, 7, 8, 8, 10], 8)
p search_range([5, 7, 7, 8, 8, 10], 6)
p search_range([], 0)
