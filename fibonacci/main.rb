# ダイナミックプログラミング

# フィボナッチ数列を普通に出力
def fib(n)
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
    nums << nums[i - 2] + nums[i - 1]
  end

  nums
end

p fib(0)
p fib(1)
p fib(2)
p fib(3)
p fib(4)
p fib(10)
p fib(100)
