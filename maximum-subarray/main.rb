# @param {Integer[]} nums
# @return {Integer}
def max_sub_array_bf(nums)
  max_subarray = -Float::INFINITY
  nums.each_with_index do |n, i|
    current_sub_array = 0
    nums[i...nums.size].each do |m|
      current_sub_array += m
      max_subarray = [max_subarray, current_sub_array].max
    end
  end

  max_subarray
end

p max_sub_array([-2, 1, -3, 4, -1, 2, 1, -5, 4])
# p max_sub_array([1])
# p max_sub_array([5,4,-1,7,8])
