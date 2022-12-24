# @param {Integer} target
# @param {Integer[]} nums
# @return {Integer}

# Runtime 102 ms Beats 98.15%
# Memory 214 MB Beats 75.93%
def min_sub_array_len(target, nums)
  n = nums.size
  ans = Float::INFINITY
  head = 0
  sum = 0
  n.times do |i|
    sum += nums[i]
    while sum >= target
      ans = [ans, i + 1 - head].min
      sum -= nums[head]
      head += 1
    end
  end

  ans == Float::INFINITY ? 0 : ans
end

# 解けず
def my_min_sub_array_len(target, nums)
  max = nums.max
  return 1 if target <= max

  sum = nums.sum
  return 0 if target > sum
  return nums.size if nums.size == sum

  sub_array = []
  sub_sum = 0
  length = 0
  min_length = Float::INFINITY
  nums.each do |n|
    sub_array << n
    sub_sum += n
    length += 1

    next if target > sub_sum

    while target < sub_sum
      m = sub_array.shift
      sub_sum -= m
      length -= 1
    end

    p sub_array
  end

  min_length
end

p min_sub_array_len(11, [1, 2, 3, 4, 5])
p min_sub_array_len(7, [2, 3, 1, 2, 4, 3])
p min_sub_array_len(4, [1, 4, 4])
p min_sub_array_len(11, [1, 1, 1, 1, 1, 1, 1, 1])
