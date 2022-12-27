# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.

# Runtime 147 ms Beats 75.78%
# Memory 212.8 MB Beats 78.88%
def move_zeroes(nums)
  i = 0
  zero_count = 0
  while i < nums.size - 1
    if nums[i] == 0
      zero_count += 1
      nums.delete_at(i)
      next
    end
    i += 1
  end

  # nums.delete(0)
  zero_count.times do
    nums << 0
  end

  nums
end

p move_zeroes([0, 1, 0, 3, 12])
p move_zeroes([0])
