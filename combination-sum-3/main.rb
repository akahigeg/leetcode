# @param {Integer} k
# @param {Integer} n
# @return {Integer[][]}

# バックトラック
# Runtime: 71 ms, faster than 100.00% of Ruby online submissions for Combination Sum III.
# Memory Usage: 210.9 MB, less than 70.00% of Ruby online submissions for Combination Sum III.
#
# バックトラックする前
# Runtime: 185 ms, faster than 10.00% of Ruby online submissions for Combination Sum III.
# Memory Usage: 211.1 MB, less than 50.00% of Ruby online submissions for Combination Sum III.
MAX_NUMBER = 9
def combination_sum3(k, n)
  @number_count = k
  @target = n
  @step = 0
  sums = []
  find_sums(sums)

  p @step
  sums
end

def find_sums(sums = [], combination = [], start = 1)
  @step += 1
  # p combination

  # @step => 96
  return if combination.size > @number_count || combination.sum > @target

  # @step => 481
  if combination.sum == @target && combination.size == @number_count
    sums << combination.clone 
    return
  end

  (start..MAX_NUMBER).each do |i|
    combination << i

    # @step => 512
    # if combination.sum == @target && numbers.size == @number_count
    #   sums << combination.clone 
    # end

    find_sums(sums, combination, i + 1)
    combination.pop
  end

  sums
end

p combination_sum3(3, 7)
p combination_sum3(3, 9)
p combination_sum3(4, 1)