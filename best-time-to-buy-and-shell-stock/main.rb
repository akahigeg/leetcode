# @param {Integer[]} prices
# @return {Integer}

# Runtime 226 ms Beats 80.65%
# Memory 220.8 MB Beats 79.17%
def max_profit(prices)
  min = prices.first
  max = 0

  prices.each do |price|
    min = price if min > price

    profit = price - min
    max = profit if max < profit
  end

  max
end

p max_profit([7, 1, 5, 3, 6, 4])
