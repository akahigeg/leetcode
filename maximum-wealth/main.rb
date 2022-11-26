# @param {Integer[][]} accounts
# @return {Integer}

# Runtime: 148 ms, faster than 48.40% of Ruby online submissions for Richest Customer Wealth.
# Memory Usage: 211.2 MB, less than 52.05% of Ruby online submissions for Richest Customer Wealth.
#
# max使わない分ちょっと速いかと思った
def maximum_wealth(accounts)
  maximum = 0
  accounts.each do |wealths|
    sum = wealths.sum
    maximum = sum if maximum < sum
  end

  maximum
end

# Runtime: 154 ms, faster than 39.27% of Ruby online submissions for Richest Customer Wealth.
# Memory Usage: 211.3 MB, less than 52.05% of Ruby online submissions for Richest Customer Wealth.
def maximum_wealth_one_liner(accounts)
  accounts.map { |w| w.sum }.max
end

p maximum_wealth([[1, 2, 3], [3, 2, 1]])
p maximum_wealth([[1, 5], [7, 3], [3, 5]])
p maximum_wealth([[2, 8, 7], [7, 1, 3], [1, 9, 5]])
