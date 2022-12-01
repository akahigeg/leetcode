# @param {Integer} x
# @return {Boolean}

# Runtime: 228 ms, faster than 48.57% of Ruby online submissions for Palindrome Number.
# Memory Usage: 210.9 MB, less than 83.19% of Ruby online submissions for Palindrome Number.
def is_palindrome_str(x)
  return false if x.negative?

  x.to_s == x.to_s.reverse
end

# Runtime: 124 ms, faster than 89.60% of Ruby online submissions for Palindrome Number.
# Memory Usage: 210.9 MB, less than 83.19% of Ruby online submissions for Palindrome Number.
def is_palindrome(x)
  # xがマイナスのとき、2桁以上の場合に0で終わるときは回文にはならない
  return false if x.negative? || (x % 10 == 0 && x != 0)

  # 桁あふれ防止のために半分まで反転させて比較する
  rev = 0
  while x > rev
    x_last_digit = x % 10 # x % 10 で xの最後の桁が求まる
    rev *= 10             # revを10倍して位を上げる
    rev += x_last_digit   # 0になった1の位に最後の桁を入れる
    x /= 10               # xから最後の桁を取り除く
  end

  x == rev || x == rev/10 # rev
end

p is_palindrome(121)
p is_palindrome(-121)
p is_palindrome(10)