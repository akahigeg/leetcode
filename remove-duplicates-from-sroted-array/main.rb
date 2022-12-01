# @param {Integer[]} nums
# @return {Integer}

# Runtime: 144 ms, faster than 73.59% of Ruby online submissions for Remove Duplicates from Sorted Array.
# Memory Usage: 211.8 MB, less than 49.35% of Ruby online submissions for Remove Duplicates from Sorted Array.
def remove_duplicates(nums)
  # 制約: 新しい配列を作ってはいけない
  i = 0
  new_index = 0
  prev = nil
  while nums[i]
    unless nums[i] == prev
      # 数が異なる場合
      # p "#{nums[i]} to #{new_index}"
      nums[new_index] = nums[i]
      new_index += 1
      prev = nums[i]
    end

    i += 1
  end

  nums = nums[0..(new_index - 1)]

  nums
end

p remove_duplicates([1, 2, 1])
p remove_duplicates([0,0,1,1,1,2,2,3,3,4])