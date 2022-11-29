# @param {String} s
# @param {Integer} num_rows
# @return {String}

# Runtime: 267 ms, faster than 61.54% of Ruby online submissions for Zigzag Conversion.
#Memory Usage: 211.2 MB, less than 50.00% of Ruby online submissions for Zigzag Conversion.
def convert(s, num_rows)
  return s if num_rows == 1

  s_length = s.size

  lines = []
  num_rows.times { lines << [] }

  last_line_index = num_rows - 1

  i = 0
  while i < s_length
    # 縦
    line_index = 0
    while line_index < num_rows
      lines[line_index] << s[i] unless s[i].nil?
      line_index += 1
      i += 1
    end

    # 斜め
    line_index = last_line_index - 1
    while line_index > 0
      lines[line_index] << s[i] unless s[i].nil?
      line_index -= 1
      i += 1
    end
  end

  lines.join
end

# 実行時間は誤差
#
# Runtime: 115 ms, faster than 98.46% of Ruby online submissions for Zigzag Conversion.
# Memory Usage: 211 MB, less than 76.92% of Ruby online submissions for Zigzag Conversion.
# Runtime: 274 ms, faster than 58.46% of Ruby online submissions for Zigzag Conversion.
# Memory Usage: 211.3 MB, less than 50.00% of Ruby online submissions for Zigzag Conversion.
def convert_easy_implimantation(s, num_rows)
  chars = s.chars

  lines = []
  num_rows.times { lines << [] }

  # 先頭行と最終行以外のインデックスをひっくり返したもの
  mid_line_indexes = []
  lines.each_index do |i|
    mid_line_indexes.push(i) if i > 0 && i < lines.size - 1
  end
  mid_line_indexes.reverse!

  until chars.empty?
    # 縦
    lines.each_index do |line_index|
      c = chars.shift
      lines[line_index] << c unless c.nil?
    end

    # 斜め
    mid_line_indexes.each do |mid_line_index|
      c = chars.shift
      lines[mid_line_index] << c unless c.nil?
    end
  end

  lines.join
end

p convert("PAYPALISHIRING", 3)
p convert("PAYPALISHIRING", 4)
p convert("PAYPALISHIRING", 1)
p convert("A", 1)

# num_rows = 3
#
# 0 4 8 2
# 1357913
# 2 6 0

# num_rows = 4
#
# 0  6  2
# 1 57 13
# 24 80
# 3  9

# num_rows = 5
#
# 0   7
# 1  68
# 2 5 9 3
# 34  02
# 4   1

# num_rows = 6
#
# 0    0
# 1   91
# 2  8 2
# 3 7  3
# 46
# 5
