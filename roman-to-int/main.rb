# @param {String} s
# @return {Integer}
def roman_to_int(s)
    number = 0
    chars = s.split(//)

    prev_char = ''
    chars.each do |char|
      number += 1 if char == 'I'
      number += 5 if char == 'V' && prev_char != 'I'
      number += 3 if char == 'V' && prev_char == 'I'
      number += 10 if char == 'X' && prev_char != 'I'
      number += 8 if char == 'X' && prev_char == 'I'
      number += 50 if char == 'L' && prev_char != 'X'
      number += 30 if char == 'L' && prev_char == 'X'
      number += 100 if char == 'C' && prev_char != 'X'
      number += 80 if char == 'C' && prev_char == 'X'
      number += 500 if char == 'D' && prev_char != 'C'
      number += 300 if char == 'D' && prev_char == 'C'
      number += 1000 if char == 'M' && prev_char != 'C'
      number += 800 if char == 'M' && prev_char == 'C'

      prev_char = char
    end

    number
end

# 参考: https://www.asahi-net.or.jp/~ax2s-kmtn/ref/roman_num.html

# https://stackoverflow.com/questions/53033844/roman-to-integer-refactored
H = {"VI"=>" 4", "XI"=>" 9", "LX"=>" 40", "CX"=>" 90", "DC"=>" 400", "MC"=>" 900",
     "I"=>" 1", "V"=>" 5", "X"=>" 10", "L"=>" 50", "C"=>" 100", "D"=>" 500", "M"=>" 1000"}

def roman_to_integer(roman_string)
   roman_string.reverse.gsub(Regexp.union(H.keys), H).split.sum(&:to_i)
end

p roman_to_int('III')
p roman_to_integer('III')
p roman_to_integer('XIV')
