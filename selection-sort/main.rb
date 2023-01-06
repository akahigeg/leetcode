def selection_sort(nums)
  i = 0
  while i < nums.size
    j = i
    min_index = i
    while j < nums.size
      min_index = j if nums[j] < nums[min_index]
      j += 1
    end
    nums[i], nums[min_index] = nums[min_index], nums[i]
    i += 1
  end

  nums
end

p selection_sort([4, 3, 1, 2, 6, 5])
p selection_sort([4, 3, 1, 2, 5, 0, -1])
p selection_sort(((1..9).to_a + (1..9).to_a).shuffle)
