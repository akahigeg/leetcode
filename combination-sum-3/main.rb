# @param {Integer} k
# @param {Integer} n
# @return {Integer[][]}

# Runtime: 185 ms, faster than 10.00% of Ruby online submissions for Combination Sum III.
# Memory Usage: 211.1 MB, less than 50.00% of Ruby online submissions for Combination Sum III.
def combination_sum3(k, n)
  @number_count = k
  @target = n
  find_sums()
end

def find_sums(sums = [], numbers = [], start = 1)
  # p numbers
  (start..9).each do |i|
    numbers << i

    if numbers.sum == @target && numbers.size == @number_count
      sums << numbers.clone 
    end

    find_sums(sums, numbers, i + 1)
    numbers.pop
  end

  sums
end

p combination_sum3(3, 7)
p combination_sum3(3, 9)
p combination_sum3(4, 1)
