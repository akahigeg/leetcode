# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
  return 0 if amount == 0

  coins.sort!

  # 小さい方のコインから処理する
  # 大きいコインが小さい方の倍数なら、大きい方に両替してコインの数を減らす
  count = 0
  until coins.empty?
    coin = coins.pop
    count += amount / coin
    p "#{coin}: #{amount / coin}, 余り#{amount % coin}"
    amount = amount % coin
  end

  return -1 if amount > 0

  count
end

p coin_change([2, 3], 10)
p coin_change([2, 3], 13)
# p coin_change([1, 2, 5], 11)
# p coin_change([2], 3)
# p coin_change([1], 0)

# p coin_change([2, 5, 10, 1], 27)
# p coin_change([186, 419, 83, 408], 6249) # => 20
