# @param {String} s
# @return {Boolean}

# Runtime: 144 ms, faster than 61.12% of Ruby online submissions for Valid Parentheses.
# Memory Usage: 211.2 MB, less than 37.07% of Ruby online submissions for Valid Parentheses.
def is_valid(s)
  pairs = { "(" => ")", "[" => "]", "{" => "}" }
  stack = []
  s.each_char do |char|
    # カッコ以外の文字列があっても大丈夫
    next unless "()[]{}".include?(char)

    # charが閉じカッコでスタックの頭に対応する開きカッコがあればpop
    if pairs[stack&.last] == char
      stack.pop
    else
      stack << char
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
