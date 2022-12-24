# @param {Integer[]} nums
# @return {Integer}

# Runtime 84 ms Beats 63.96%
# Memory 211 MB Beats 46.19%
def rob(nums)
  memo = {}
  rob_from(0, nums, memo)
end

def rob_from(i, nums, memo)
  return 0 if i >= nums.size

  return memo[i] if memo[i]

  sum = [rob_from(i + 1, nums, memo), rob_from(i + 2, nums, memo) + nums[i]].max
  memo[i] = sum
end

# 解けず
def my_rob(nums)
  i = 0
  sum = 0
  taken = []
  while i < nums.size
    # 末尾の数に来たら（末尾の前の数を取っていないなら）末尾の数を取る
    if nums[i + 1].nil?
      p "+#{nums[i]}"
      sum += nums[i]
      break
    end

    # 現在の数、次の数、次の次の数を比較
    current = nums[i]
    _next = nums[i + 1] || 0
    _next_next = nums[i + 2] || 0

    # 現在の数が次の数より大きく、次の数が次の次の数より小さい場合は、現在の数を取る
    if current > _next && _next < _next_next
      p "+#{current}"
      sum += current
      i += 1
      taken << i
    end

    # 現在の数が次の数より小さく、次の数が次の次の数より小さい場合は、現在の数を取る
    if current < _next && _next < _next_next
      p "+#{current}"
      sum += current
      i += 1
      taken << i
    end

    i += 1
  end

  # 空きが3つ続いているところがあれば真ん中を取る
  prev_taken = taken.first
  taken.each do |n|
    if n - prev_taken >= 3
      sum += nums[n - 2]
    end
    prev_taken = n
  end

  sum
end

p rob([1, 4, 2, 9, 10])     # => 14
p rob([1, 4, 2, 9, 10])     # => 14
p rob([1, 4, 2, 9, 10, 15]) # => 28
p rob([1, 4, 2, 9, 11, 10]) # => 23
p rob([1, 2, 3, 1])         # => 4
p rob([2, 7, 9, 3, 1])      # => 2 + 9 + 1 = 12
