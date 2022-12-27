# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.

# ref: https://leetcode.com/problems/move-zeroes/solutions/72193/ruby-solution/
# 0を動かすのではなく0以外を動かす
def move_zeroes(nums)
  last_zero_position = -1

  i = 0
  while i < nums.size
    if last_zero_position == -1
      if nums[i] == 0
        last_zero_position = i
      end
    else
      if nums[i] == 0
        i += 1
        next
      end

      nums[last_zero_position], nums[i] = nums[i], nums[last_zero_position]
      last_zero_position += 1
    end

    i += 1
  end

  nums
end

# Runtime 147 ms Beats 75.78%
# Memory 212.8 MB Beats 78.88%
def my_move_zeroes(nums)
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

# ref:https://leetcode.com/problems/move-zeroes/solutions/840708/ruby-simple/
def move_zeroes_compact_code(nums)
  zero_count = nums.count(0)
  nums.delete(0)

  # nums.delete(0)
  zero_count.times do
    nums << 0
  end

  nums
end

p move_zeroes([0, 1, 0, 3, 12])
p move_zeroes([0])
