# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}

# ref: https://leetcode.com/problems/subarray-sum-equals-k/discuss/593213/Ruby-simple-solution
# Runtime: 163 ms, faster than 64.29% of Ruby online submissions for Subarray Sum Equals K.
# Memory Usage: 219.4 MB, less than 7.14% of Ruby online submissions for Subarray Sum Equals K.
def subarray_sum(nums, k)
  count = 0
  sum = 0

  hash = {}
  hash[0] = 1

  # numsの中にマイナスがある点、カウントのみを求めればいい点が肝
  # 累計 - k が成り立つ範囲がいくつあるかを数えればOK
  i = 0
  while i < nums.size
    # 累計を出して、累計 - k が
    sum += nums[i]
    count += hash[sum - k] if hash[sum - k]

    # 同じ累計の数を記録
    hash[sum] ||= 0
    hash[sum] += 1

    i += 1
  end

  count
end

# 1 => sum: 1, hash[1 - 2]: nil, hash[1]: 1, count: 0 (hash[-1] = 0)
# 1 => sum: 2, hash[2 - 2]: 1,   hash[2]: 1, count: 1 (hash[0] = 1 => +1)
# 1 => sum: 3, hash[3 - 2]: 1,   hash[3]: 1, count: 2 (hash[1] = 1 => +1)
# 1 => sum: 4, hash[4 - 2]: 1,   hash[4]: 1, count: 3 (hash[2] = 1 => +1)

# Time Limit Exceeded
def my_subarray_sum(nums, k)
  start = 0
  count = 0
  while start < nums.size
    sum = nums[start]
    last = start
    while last < nums.size
      if start != last
        sum += nums[last]
      end

      if sum == k
        count += 1
      end
      last += 1
    end

    start += 1
  end

  count
end

p subarray_sum([1, 1, 1], 2) # => 2
p subarray_sum([1, 1, 1, 1], 2) # => 2
p subarray_sum([1, 2, 3], 3) # => 2
p subarray_sum([1, -1, 0], 0) # => 3
p subarray_sum([0, 0], 0) # => 3
p subarray_sum([3, 4, 7], 7) # => 3
