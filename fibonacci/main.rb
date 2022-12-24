# ダイナミックプログラミング

require "benchmark"

# フィボナッチ数列を普通に出力
# 0から
#
# 再帰で書くと速度が問題になる以前にstack level too deepになってしまうのでループで
#
def fib_array(n)
  nums = []

  (0..n).each do |i|
    if i == 0
      nums << 0
      next
    end

    if i == 1
      nums << 1
      next
    end

    nums << nums[i - 2] + nums[i - 1] # ダイナミックプログラミング
  end

  nums
end

p fib_array(0)
p fib_array(1)
p fib_array(2)
p fib_array(3)
p fib_array(4)
p fib_array(10)
p fib_array(30)

def fib(n)
  fib_array(n).last
end

p fib(0)
p fib(1)
p fib(2)
p fib(3)
p fib(4)
p fib(10)
p fib(30)
# p fib_last(100000)

# ダイナミックプログラミングではないパターン
# メモリが節約できるはず
# いや、直線の数を保存してるからこれもダイナミックプログラミングなの？
def fib_no_dp(n)
  sum = 0
  prev = 0
  prev_prev = 0
  (0..n).each do |i|
    if i == 0
      sum += 0
      next
    end

    if i == 1
      sum += 1
      prev = sum
      next
    end

    sum = prev + prev_prev

    prev_prev = prev
    prev = sum
  end

  sum
end

p fib_no_dp(0)
p fib_no_dp(1)
p fib_no_dp(2)
p fib_no_dp(3)
p fib_no_dp(4)
p fib_no_dp(10)
p fib_no_dp(30)

# 再帰
def fib_recurse(n)
  return 0 if n == 0
  return 1 if n == 1
  fib_recurse(n - 2) + fib_recurse(n - 1)
end

p fib_recurse(10)

# 再帰メモ化
@memo = []

def fib_recurse_memo(n, memo = [0, 1])
  return memo[n] if memo[n]
  # return 0 if n == 0
  # return 1 if n == 1
  memo[n] = fib_recurse_memo(n - 2, memo) + fib_recurse_memo(n - 1, memo)
end

p fib_recurse_memo(10)

require "matrix"

# 対数時間
def fib_log(n)
  (Matrix[[1, 1], [1, 0]] ** n)[0, 1]
end

p fib_log(10)

Benchmark.bm 10 do |r|
  r.report "dp" do
    10.times { fib(30) }
  end
  r.report "no dp" do
    10.times { fib_no_dp(30) }
  end
  r.report "no dp 2" do
    10.times { fib_no_dp(30) }
  end
  r.report "dp 2" do
    10.times { fib(30) }
  end
  r.report "recurse" do
    # 遅い
    10.times { fib_recurse(30) }
  end
  r.report "recurse with memo" do
    10.times { fib_recurse_memo(30) }
  end
  r.report "log" do
    10.times { fib_log(30) }
  end
end

# require "memprof2"

p "fib"
result = Benchmark.realtime do
  100.times { fib(30) }
end
p result

p "fib_no_db"
result = Benchmark.realtime do
  100.times { fib_no_dp(30) }
end
p result

p "fib_recurse"
result = Benchmark.realtime do
  # 遅い
  100.times { fib_recurse(30) }
end
p result

p "fib_recurse_memo"
result = Benchmark.realtime do
  100.times { fib_recurse_memo(30) }
end
p result

p "fib_log"
result = Benchmark.realtime do
  100.times { fib_log(30) }
end
p result
