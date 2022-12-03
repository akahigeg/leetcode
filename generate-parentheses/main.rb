# @param {Integer} n
# @return {String[]}

# バックトラッキング
# 解の候補をしらみつぶしに試していくが、途中で解になりえないと分かった候補群は間引いていく

# Runtime: 120 ms, faster than 78.63% of Ruby online submissions for Generate Parentheses.
# Memory Usage: 211.3 MB, less than 64.89% of Ruby online submissions for Generate Parentheses.
def generate_parenthesis(n)
  answer = []

  backtrack(answer, n)

  answer
end

def backtrack(answer, n, sequence = [], open_count = 0, close_count = 0)
  # p "open: #{open_count}: close: #{close_count}, n: #{n}, #{sequence.join}" + (sequence.size == n * 2 ? " [OK]" : "")

  # open_count + close_count == 2 になったときreturn
  if sequence.size == n * 2
    answer << sequence.join
    return 
  end

  # まず左側から開きカッコを並べていく
  if open_count < n
    sequence << "("
    # 開きカッコを増やしたパターンで再帰
    backtrack(answer, n, sequence, open_count + 1, close_count)
    sequence.pop
  end

  # 次にclose_countがopen_countより小さければ閉じカッコを置く
  # => 無駄な候補を試さない
  if close_count < open_count
    sequence << ")"
    # 閉じカッコを増やしたパターンで再帰
    backtrack(answer, n, sequence, open_count, close_count + 1)
    sequence.pop
  end
end

p generate_parenthesis(1)
p generate_parenthesis(2)
p generate_parenthesis(3)
p generate_parenthesis(4)
p generate_parenthesis(5)

# 1 => ()
# 2 => ()(), (())
# 3 => ()()(), ((())), (()(())), ((())()), (()())
