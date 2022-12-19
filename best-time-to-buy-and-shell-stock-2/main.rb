# @param {Integer[]} prices
# @return {Integer}

def max_profit_single_pass(prices)
  profit = 0
  (0...prices.size).each do |i|
    next if i == 0

    if prices[i] > prices[i - 1]
      profit += prices[i] - prices[i - 1]
    end
  end
end

# Runtime 71 ms Beats 98.25%
# Memory 211.4 MB Beats 64.91%
def max_profit(prices)
  # 在庫を持っていなくて、価格が最低になったところで買う 谷
  #   最低になった = 次の日よりも安い
  # 在庫を持っていて、価格が最高になったところで売る 頂点
  #   最高になった = 次の日よりも高い

  profit = 0

  i = 0
  while i < prices.size - 1
    while i < prices.length - 1 && prices[i] >= prices[i + 1]
      i += 1
    end
    valley = prices[i]

    while i < prices.length - 1 && prices[i] <= prices[i + 1]
      i += 1
    end
    peak = prices[i]

    profit += peak - valley
  end

  profit
end

p max_profit([7, 1, 5, 3, 6, 4])
p max_profit([1, 2, 3, 4, 5])
p max_profit([7, 6, 4, 3, 1])
p max_profit([2, 4, 1])
p max_profit([2, 2, 5])
