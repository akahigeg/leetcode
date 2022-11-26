# @param {Integer} num
# @return {Integer}

# Runtime: 155 ms, faster than 34.81% of Ruby online submissions for Number of Steps to Reduce a Number to Zero.
# Memory Usage: 211.2 MB, less than 11.05% of Ruby online submissions for Number of Steps to Reduce a Number to Zero.
def number_of_steps(num)
  count = 0
  Kernel.loop do
    break if num == 0

    if num.odd?
      count += 1
      num -= 1
    else
      count += 1
      num = num / 2
    end
  end

  count
end

p number_of_steps(14)
p number_of_steps(8)
p number_of_steps(123)
