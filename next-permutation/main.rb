# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
# ref: https://leetcode.com/problems/next-permutation/discuss/334181/ruby-simple-solution
#

# Runtime: 84 ms, faster than 97.62% of Ruby online submissions for Next Permutation.
# Memory Usage: 211.1 MB, less than 47.62% of Ruby online submissions for Next Permutation.
def next_permutation(nums)
  # [3,2,1] => [1,2,3]
  # Run Code => OK. Output is [1,2,3]
  # Submit => NG. Output is [3,2,1]
  return nums.sort if nums == nums.sort.reverse
  # Workaround
  # return nums.reverse! if nums == nums.sort.reverse

  # 末尾-1から最小の数を探す
  left = nums.size - 2
  Kernel.loop do
    break if nums[left] < nums[left + 1]
    left -= 1
  end

  right = nil
  (left + 1).upto(nums.size - 1) do |j|
    if right.nil? || (nums[j] - nums[left] > 0 && nums[j] - nums[left] < nums[right] - nums[left])
      right = j
    end
  end

  nums[left], nums[right] = nums[right], nums[left]

  return nums.slice(0..left) + nums.slice(left + 1..-1).sort

  # Submitするときになんかバグってるのワークアラウンド
  (left + 1).upto(nums.size - 1) do |k|
    nums[k] = new_array[k]
  end
end

p next_permutation([3, 2, 1])

require "minitest/autorun"

class TestProblem < MiniTest::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_ex1
    assert_equal [1, 3, 2], next_permutation([1, 2, 3])
  end

  def test_ex2
    assert_equal [1, 2, 3], next_permutation([3, 2, 1])
  end

  def test_ex3
    assert_equal [1, 5, 1], next_permutation([1, 1, 5])
  end

  def test_1_num
    assert_equal [1], next_permutation([1])
  end

  def test_5_num
    assert_equal [1, 2, 3, 5, 4], next_permutation([1, 2, 3, 4, 5])
  end

  def test_single_patter_approach
    assert_equal [1, 5, 8, 5, 1, 3, 4, 6, 7], next_permutation([1, 5, 8, 4, 7, 6, 5, 3, 1])
  end
end
