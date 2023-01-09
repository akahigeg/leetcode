# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}

# ref: https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/solution/
# Runtime: 82 ms, faster than 95.00% of Ruby online submissions for Two Sum II - Input Array Is Sorted.
# Memory Usage: 212.3 MB, less than 10.00% of Ruby online submissions for Two Sum II - Input Array Is Sorted.
def two_sum(numbers, target)
  lo = 0
  hi = numbers.size - 1
  while lo < hi
    sum = numbers[lo] + numbers[hi]
    return [lo + 1, hi + 1] if sum == target

    if sum < target
      lo += 1
    else
      hi -= 1
    end
  end

  [-1, -1]
end

# Runtime: 119 ms, faster than 65.00% of Ruby online submissions for Two Sum II - Input Array Is Sorted.
# Memory Usage: 212.3 MB, less than 7.14% of Ruby online submissions for Two Sum II - Input Array Is Sorted.
def my_two_sum(numbers, target)
  i = 0
  while i < numbers.size - 1
    j = numbers[(i + 1)..].bsearch_index { |n| n + numbers[i] >= target }

    if j.nil? || numbers[i] + numbers[j + i + 1] != target
      i += 1
      next
    end

    # p "nums[i]: #{numbers[i]}, target: #{target}, #{target - numbers[i]}"
    # 1-indexedなのでそれぞれ+1して返す
    one_indexed_i = i + 1
    one_indexed_j = j + one_indexed_i + 1
    return [one_indexed_i, one_indexed_j]
  end
end

p two_sum([2, 7, 11, 15], 9)
p two_sum([2, 3, 4], 6)
p two_sum([1, 2, 3, 4], 6)
p two_sum([-1, 0], -1)
p two_sum([5, 25, 75], 100)
p two_sum([3, 24, 50, 79, 88, 150, 345], 200)
