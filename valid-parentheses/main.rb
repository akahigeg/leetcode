# @param {String} s
# @return {Boolean}

# Runtime: 73 ms, faster than 97.47% of Ruby online submissions for Valid Parentheses.
# Memory Usage: 211.1 MB, less than 37.07% of Ruby online submissions for Valid Parentheses.
def is_valid(s)
  pairs = { "(" => ")", "[" => "]", "{" => "}" }
  stack = []
  s.each_char do |char|
    # 問題にはないがカッコ以外の文字列があっても大丈夫という実用に即した仕様
    next unless "()[]{}".include?(char)

    if "([{".include?(char)
      # 開きカッコをスタックに積む
      stack << char
    else
      # 閉じカッコが来たとき、スタックの頭が対応する開きカッコでない場合はfalse
      # それ以降をチェックする必要はない => 高速化
      return false unless pairs[stack&.last] == char

      # 対応する開きカッコがあればそれをスタックから取り除く
      stack.pop
    end
  end
  stack.empty?
end

# 力業の極み
#
# Runtime: 128 ms, faster than 73.78% of Ruby online submissions for Valid Parentheses.
# Memory Usage: 219.7 MB, less than 5.61% of Ruby online submissions for Valid Parentheses.
def is_valid_force(s)
  i = 0
  s_initial_length = s.size
  while i < s_initial_length / 2
    s.gsub!("()", "")
    s.gsub!("[]", "")
    s.gsub!("{}", "")

    i += 1
  end

  s.empty?
end

def is_valid_for_one_type(s)
  stack = []

  s.each_char do |char|
    if "(".include?(char)
      stack.push(char)
      next
    end

    if ")".include?(char)
      if stack.size > 0
        stack.pop
      else
        return false
      end
    end
  end

  stack.empty?
end

# 対応するカッコまでの間にペアにならないカッコがあってはいけない
p is_valid("()")
p is_valid("(false))")
p is_valid("((true))")
p is_valid("((false)))(")
p is_valid("(false")
p is_valid(")false")
p is_valid("[true]")
p is_valid("({[]})")
p is_valid("(({[]}))")
p is_valid("(){}[]")
p is_valid("(]")
p is_valid("(][)")
p is_valid("([)]")
