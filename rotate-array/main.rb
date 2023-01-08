# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.

# Runtime: 159 ms, faster than 74.07% of Ruby online submissions for Rotate Array.
# Memory Usage: 218.8 MB, less than 46.67% of Ruby online submissions for Rotate Array.
def rotate(nums, k)
  # nums.rotate!(-k)
  k.times { nums.unshift(nums.pop) } # popはどんな言語でも一般的に速い。unshiftは遅いことがあるがRubyのunshiftは速い
  nums
end

p rotate([1, 2, 3, 4, 5, 6, 7], 3)
