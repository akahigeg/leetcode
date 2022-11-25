# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  sums = []
  (0..(nums.size - 3)).each do |i|
    ((i+1)..(nums.size - 2)).each do |j|
      ((j+1)..(nums.size - 1)).each do |k|
        sums.push([nums[i], nums[j], nums[k]].sort) if nums[i] + nums[j] + nums[k] == 0
      end
    end
  end
  sums.uniq
end

p three_sum([0, 1, 1])
p three_sum([1, 1, 1])
p three_sum([0, 0, 0, 1, -1])