# @param {Integer} n, a positive integer
# @return {Integer}

# Runtime: 84 ms, faster than 77.27% of Ruby online submissions for Reverse Bits.
# Memory Usage: 211 MB, less than 27.27% of Ruby online submissions for Reverse Bits.
def reverse_bits(n)
  n.to_s(2).rjust(32, "0").reverse.to_i(2)
end

p reverse_bits(0b00000010100101000001111010011100)
p reverse_bits(0b001)
