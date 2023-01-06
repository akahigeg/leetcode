def bubble_sort(nums)
  i = 0
  while i < nums.size
    j = 0
    while j < nums.size - i - 1
      nums[j], nums[j + 1] = nums[j + 1], nums[j] if nums[j] > nums[j + 1]
      j += 1
    end
    i += 1
  end

  nums
end

p bubble_sort([4, 3, 1, 2, 5])
p bubble_sort(((1..9).to_a + (1..9).to_a).shuffle)
