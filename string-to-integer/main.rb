# @param {String} s
# @return {Integer}

# Runtime: 88 ms, faster than 93.01% of Ruby online submissions for String to Integer (atoi).
# Memory Usage: 211 MB, less than 77.62% of Ruby online submissions for String to Integer (atoi).
def my_atoi(s)
  s.strip!
  return 0 if s.match(/^[^+\-\d]/)

  matches = []
  s.match(/[+\-\d\.]+/) { |m| matches.push m }

  return 0 if matches.empty?

  number = matches.first[0].to_i

  number = -2**31 if number < -2**31
  number = 2**31 - 1 if number >= 2**31

  number
end

p my_atoi(" -42")
p my_atoi("42")
p my_atoi("404 not found")
p my_atoi("words and 987")
p my_atoi("3.14159")
p my_atoi("21474836460") # 2147483647
p my_atoi("  -0012a42")
