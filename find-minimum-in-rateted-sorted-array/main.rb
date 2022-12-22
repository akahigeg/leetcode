# @param {Integer[]} nums
# @return {Integer}

# Runtime 99 ms Beats 70.54%
# Memory 211.3 MB Beats 43.75%
def find_min(nums)
  return nums[0] if nums.size == 1

  head = 0
  tail = nums.size - 1

  return nums[0] if nums[tail] > nums[0]

  while tail >= head
    center = (tail + head) / 2

    return nums[center + 1] if nums[center] > nums[center + 1]
    return nums[center] if nums[center] < nums[center + -1]

    if nums[center] > nums[0]
      head = center + 1
    else
      tail = center - 1
    end
  end
end

p find_min([3, 4, 5, 1, 2])
p find_min([4, 5, 6, 7, 0, 1, 2])
p find_min([11, 13, 15, 17])
p find_min([3, 4, 5, 6, 1, 2])
p find_min([5, 1, 2, 3, 4])

# O(n)
#
# Runtime 70 ms Beats 98.21%
# Memory 211.3 MB Beats 9.82%
def find_min_o_n(nums)
  min = nums.first
  nums.each do |n|
    min = n if min > n
  end

  min
end
