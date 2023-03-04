# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}

# TLE
def num_subarray_product_less_than_k(nums, k)
  subarrays = []
  l = 0
  r = 0

  subarray = []
  while l < nums.size
    subarray << nums[r]
    if nums[r] && subarray.reduce(:*) < k
      subarrays.push(subarray.clone)
      r += 1
    else
      subarray = []
      l += 1
      r = l
    end
  end

  subarrays.count
end

p num_subarray_product_less_than_k([10, 5, 2, 6], 100) # => 8
p num_subarray_product_less_than_k([1, 2, 3], 0) # => 0
