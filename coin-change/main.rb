# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}

# Runtime 1112 ms Beats 61.25%
# Memory 231.7 MB Beats 7.50%
def coin_change(coins, amount)
  @memo = {}
  @coins = coins
  dfs(amount)
end

def dfs(remain)
  return -1 if remain < 0
  return 0 if remain == 0

  min_cost = Float::INFINITY
  @coins.each do |coin|
    result = @memo[remain - coin]
    unless result
      @memo[remain - coin] = result = dfs(remain - coin)
    end

    next if result == -1

    min_cost = [min_cost, result + 1].min
  end

  min_cost != Float::INFINITY ? min_cost : -1
end

# 解けず
def my_coin_change(coins, amount)
  return 0 if amount == 0

  remain = amount

  coins.sort!

  # 小さい方のコインから処理する
  # 大きいコインが小さい方の倍数なら、大きい方に両替してコインの数を減らす
  counts = {}
  coins.each do |coin|
    counts[coin] = remain / coin
    p "#{coin}: #{remain / coin}, 余り#{remain % coin}"
    remain = remain % coin
  end

  counts.each do |coin, count|
    amount_by_coin = coin * count
    coins.reverse.each do |c|
      break if coin >= c

      0.upto(count) do |current_coin_count|
        max_try_c_count = amount_by_coin / c
        max_try_c_count.downto(1) do |try_c_count|
          # p "#{coin}: #{current_coin_count}, #{c}: #{try_c_count}, amount_by_#{coin}: #{amount_by_coin}"
          # p "=> #{amount_by_coin - (current_coin_count * coin) - (try_c_count * c)}"

          if 0 == amount_by_coin - (current_coin_count * coin) - (try_c_count * c)
            counts[coin] = current_coin_count
            counts[c] = try_c_count
            break
          end
        end
      end
    end
  end

  p counts

  return -1 if amount != counts.inject(0) { |s, (k, v)| s + k * v }

  counts.values.sum
end

p coin_change([2, 3], 10)
p coin_change([2, 3], 13)
# p coin_change([1, 2, 5], 11)
# p coin_change([2], 3)
# p coin_change([1], 0)

# p coin_change([2, 5, 10, 1], 27)
# p coin_change([186, 419, 83, 408], 6249) # => 20
