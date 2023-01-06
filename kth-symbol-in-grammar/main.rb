# @param {Integer} n
# @param {Integer} k
# @return {Integer}

# Time Limit Exceeded
def kth_grammar(n, k)
  replaces = { "0" => "01", "1" => "10" }

  rows = ["0"]

  i = 1
  while i < n
    nums = rows[i - 1].split(//)
    rows << nums.map { |n| replaces[n] }.join
    i += 1
  end

  rows[-1][k - 1].to_i
end

# 0
# 01
# 0110
# 01101001

p kth_grammar(1, 1) #=> 0
p kth_grammar(2, 1) #=> 0
p kth_grammar(2, 2) #=> 1
p kth_grammar(3, 3) #=>
p kth_grammar(4, 2) #=>
