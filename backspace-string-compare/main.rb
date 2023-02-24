# @param {String} s
# @param {String} t
# @return {Boolean}

# Runtime: 87 ms, faster than 61.82% of Ruby online submissions for Backspace String Compare.
# Memory Usage: 211.1 MB, less than 50.91% of Ruby online submissions for Backspace String Compare.
def backspace_compare(s, t)
  apply_backspace(s) == apply_backspace(t)
end

def apply_backspace(s)
  stack = []
  s.each_char do |char|
    if char == "#"
      stack.pop
    else
      stack.push(char)
    end
  end

  stack.join
end

p backspace_compare("ab#c", "ad#c")
p backspace_compare("ab##", "c#d#")
p backspace_compare("a#c", "b")
