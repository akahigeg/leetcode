# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}

# ref: https://leetcode.com/problems/subarray-product-less-than-k/solution/
# Runtime: 189 ms, faster than 47.06% of Ruby online submissions for Subarray Product Less Than K.
# Memory Usage: 217.2 MB, less than 82.35% of Ruby online submissions for Subarray Product Less Than K.
def num_subarray_product_less_than_k(nums, k)
  return 0 if k <= 1

  product = 1
  count = 0
  l = 0

  nums.each_with_index do |n, r|
    product *= n
    while product >= k
      product /= nums[l]
      l += 1
    end

    count += r - l + 1
  end

  count
end

# TLE
def my_num_subarray_product_less_than_k(nums, k)
  subarrays = []
  count = 0
  l = 0
  r = 0

  subarray = []
  while l < nums.size
    # カウントだけ返せばいいのに実際に配列を作っているので重い
    subarray << nums[r]
    if nums[r] && subarray.reduce(:*) < k
      count += 1
      r += 1
    else
      subarray = []
      l += 1
      r = l
    end
  end

  count
end

p num_subarray_product_less_than_k([10, 5, 2, 6], 100) # => 8
p num_subarray_product_less_than_k([1, 2, 3], 0) # => 0
