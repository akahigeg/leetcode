# @param {Integer} n, a positive integer
# @return {Integer}

# Runtime: 70 ms, faster than 96.84% of Ruby online submissions for Number of 1 Bits.
# Memory Usage: 211 MB, less than 16.84% of Ruby online submissions for Number of 1 Bits.
def hamming_weight_array_count(n)
  n.to_s(2).split(//).filter { |m| m == "1" }.count
end

# Runtime: 87 ms, faster than 69.47% of Ruby online submissions for Number of 1 Bits.
# Memory Usage: 210.9 MB, less than 16.84% of Ruby online submissions for Number of 1 Bits.
def hamming_weight_str_count(n)
  n.to_s(2).gsub("0", "").size
end

# ref: https://leetcode.com/problems/number-of-1-bits/solution/
# Runtime: 59 ms, faster than 100.00% of Ruby online submissions for Number of 1 Bits.
# Memory Usage: 211 MB, less than 16.84% of Ruby online submissions for Number of 1 Bits.
def hamming_weight_bit_manipulation(n)
  count = 0
  while n != 0
    count += 1
    n &= (n - 1)
  end

  count
end

# Runtime: 63 ms, faster than 98.95% of Ruby online submissions for Number of 1 Bits.
# Memory Usage: 210.8 MB, less than 64.21% of Ruby online submissions for Number of 1 Bits.
def hamming_weight(n)
  count = 0
  mask = 1
  i = 0
  while i < 32
    count += 1 if n & mask != 0
    mask <<= 1
    i += 1
  end

  count
end

p hamming_weight(0b00000000000000000000000000001011)
p hamming_weight(0b11111111111111111111111111111101)
