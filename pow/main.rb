# @param {Float} x
# @param {Integer} n
# @return {Float}

# Runtime 159 ms Beats 29.33%
# Memory 211.3 MB Beats 45.33%
def my_pow(x, n)
  if n.negative?
    x = 1 / x
    n = -n
  end

  fast_pow(x, n)
end

def fast_pow(x, n)
  return 1.0 if n.zero?

  half = fast_pow(x, n / 2)
  if n % 2 == 0
    half * half
  else
    half * half * x
  end
end

# TLE
def my_pow_bf(x, n)
  if n.negative?
    x = 1 / x
    n = -n
  end
  ans = 1.0
  (0...n).each do |i|
    ans *= x
  end

  ans
end

# Runtime 162 ms Beats 25.33%
# Memory 211.2 MB Beats 45.33%
def my_pow_simple(x, n)
    x ** n
end

p my_pow(2.0, 10)
p my_pow(2.1, 3)
p my_pow(2.0, -2)