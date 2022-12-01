# @param {Integer} x
# @return {Integer}

# Runtime: 161 ms, faster than 43.72% of Ruby online submissions for Reverse Integer.
# Memory Usage: 211.1 MB, less than 13.57% of Ruby online submissions for Reverse Integer.
def reverse(x)
    r_abs = x.to_s.reverse.to_i
    return 0 if r_abs > 2 ** 31

    x.negative? ? - r_abs : r_abs
end

p reverse(-123)
p reverse(1534236469)