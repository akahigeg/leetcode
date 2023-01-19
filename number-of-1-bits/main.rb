# @param {Integer} n, a positive integer
# @return {Integer}

# Runtime: 70 ms, faster than 96.84% of Ruby online submissions for Number of 1 Bits.
# Memory Usage: 211 MB, less than 16.84% of Ruby online submissions for Number of 1 Bits.
def hamming_weight(n)
  n.to_s(2).split(//).filter { |m| m == "1" }.count
end

p hamming_weight(0b00000000000000000000000000001011)
p hamming_weight(0b11111111111111111111111111111101)
