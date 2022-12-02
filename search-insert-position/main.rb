# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}

# Runtime: 121 ms, faster than 72.07% of Ruby online submissions for Search Insert Position.
# Memory Usage: 211.2 MB, less than 72.07% of Ruby online submissions for Search Insert Position.
def search_insert(nums, target)
  left = 0
  right = nums.size - 1

  while left <= right
    center = (left + right) / 2

    return center if nums[center] == target

    # 残り要素が1になったときleftが答えになるので以下のコードは不要
    # if nums[left..right].size <= 2
    #   # p "ok, #{left}..#{right}"
    #   return left + 1 if nums[left] < target && nums[right] > target
    #   return left if nums[left] > target
    #   return right + 1 if nums[right] < target
    # end

    if nums[center] <= target
      # to right
      left = center + 1
    else
      # to left
      right = center - 1
    end
  end

  left
end

p search_insert([1,2,5,6], 5)
p search_insert([1,3,5,6], 2)
p search_insert([1,3,5,6], 0)