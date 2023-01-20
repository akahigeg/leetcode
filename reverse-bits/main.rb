# @param {Integer} n, a positive integer
# @return {Integer}

# ref: https://leetcode.com/problems/reverse-bits/solution/
# Runtime: 96 ms, faster than 56.82% of Ruby online submissions for Reverse Bits.
# Memory Usage: 210.9 MB, less than 27.27% of Ruby online submissions for Reverse Bits.
def reverse_bits_bit_by_bit(n)
  ret = 0
  31.downto(0) do |i|
    ret += (n & 1) << i
    n = n >> 1
  end

  ret
end

# Runtime: 84 ms, faster than 77.27% of Ruby online submissions for Reverse Bits.
# Memory Usage: 211 MB, less than 27.27% of Ruby online submissions for Reverse Bits.
def my_reverse_bits(n)
  n.to_s(2).rjust(32, "0").reverse.to_i(2)
end

p reverse_bits(0b00000010100101000001111010011100)
p reverse_bits(0b001)
