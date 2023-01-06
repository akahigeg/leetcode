def insertion_sort(nums)
  i = 0
  while i < nums.size - 1
    j = i + 1
    while j > 0 && nums[j] < nums[j - 1]
      nums[j], nums[j - 1] = nums[j - 1], nums[j]
      j -= 1
    end

    i += 1
  end

  nums
end

p insertion_sort([4, 3, 1, 2, 6, 5])
p insertion_sort([4, 3, 1, 2, 5, 0, -1])
p insertion_sort(((1..9).to_a + (1..9).to_a).shuffle)
