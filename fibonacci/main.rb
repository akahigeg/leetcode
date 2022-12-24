# ダイナミックプログラミング

# フィボナッチ数列を普通に出力
# 0から
#
# 再帰で書くと速度が問題になる以前にstack level too deepになってしまうのでループで
#
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

    nums << nums[i - 2] + nums[i - 1] # すでにメモ化
  end

  nums
end

p fib(0)
p fib(1)
p fib(2)
p fib(3)
p fib(4)
p fib(10)
p fib(30)

def fib_last(n)
  fib(n).last
end

p fib_last(0)
p fib_last(1)
p fib_last(2)
p fib_last(3)
p fib_last(4)
p fib_last(10)
p fib_last(30)
# p fib_last(100000)
