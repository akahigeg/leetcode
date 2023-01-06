# @param {Integer} n
# @param {Integer} k
# @return {Integer}

# Runtime: 63 ms, faster than 50.00% of Ruby online submissions for K-th Symbol in Grammar.
# Memory Usage: 211.2 MB, less than 100.00% of Ruby online submissions for K-th Symbol in Grammar.
def kth_grammar(n, k)
  (k - 1).to_s(2).count("1") % 2
end

# Runtime: 149 ms, faster than 50.00% of Ruby online submissions for K-th Symbol in Grammar.
# Memory Usage: 211 MB, less than 100.00% of Ruby online submissions for K-th Symbol in Grammar.
def kth_grammar_parent_variant(n, k)
  return 0 if n == 1
  (1 - k % 2) ^ kth_grammar(n - 1, (k + 1) / 2)
end

# Time Limit Exceeded
# メモ化で工夫してみたけどダメだった
def my_kth_grammar(n, k)
  memo = [["0", "zo"], ["1", "oz"]] # 0 => z(zero), 1 => o(one)

  rows = ["0"]

  i = 1
  while i < n
    nums = rows[i - 1].clone
    nums = replace(nums, memo)

    nums = codes_to_nums(nums)

    memo.unshift([nums, nums_to_codes(replace(nums.clone, memo))])
    # p "nums: #{nums}, codes: #{codes}"

    rows << nums
    i += 1
  end

  rows[-1][k - 1].to_i
  # rows
end

def replace(nums, memo)
  memo.each do |r|
    nums.gsub!(r[0], r[1])
  end

  nums
end

def nums_to_codes(nums)
  nums.gsub("0", "z").gsub("1", "o")
end

def codes_to_nums(codes)
  codes.gsub("z", "0").gsub("o", "1")
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
