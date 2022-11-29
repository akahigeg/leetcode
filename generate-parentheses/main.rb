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

def backtrack(answer, n, sequence = [], open_index = 0, close_index = 0)
  # n*2 => 括弧を使い切ったらその時点のanswerをreturn
  if sequence.size == n * 2
    answer.push sequence.join
    return answer
  end

  # まず左側から開きカッコを並べていく
  if open_index < n
    p "#{open_index}: #{n}"
    sequence.push "("
    # open_indexに開きカッコを置いたパターンが網羅される
    backtrack(answer, n, sequence, open_index + 1, close_index)
    sequence.pop
  end

  # 次にclose_indexがopen_indexより小さければ閉じカッコを置く
  if close_index < open_index
    sequence.push ")"
    # close_indexに閉じカッコを置いたパターンが網羅される
    backtrack(answer, n, sequence, open_index, close_index + 1)
    sequence.pop
  end
end

p generate_parenthesis(1)
p generate_parenthesis(2)
p generate_parenthesis(3)
p generate_parenthesis(4)

# 1 => ()
# 2 => ()(), (())
# 3 => ()()(), ((())), (()(())), ((())()), (()())
