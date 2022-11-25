# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.nil? || strs.empty?

  strs.sort!{|s1, s2| s1.size <=> s2.size }

  common_prefix = ""
  prefix = ""

  shortest_str = strs[0]
  # each_with_indexもちょっと遅い？
  # shortest_str.split(//).each_with_index do |char, i|
  #   prefix += char
  (0..(shortest_str.size - 1)).each do |i|
    prefix += shortest_str[i]

    # 比較に正規表現をやめたら速い
    break unless strs.all?{|str| str[0..i] == prefix }

    common_prefix = prefix
  end

  common_prefix
end

p longest_common_prefix(["flower","flow","flight"])

def longest_common_prefix_pre(strs)
  return "" if strs.nil? || strs.empty?

  strs.sort!{|s1, s2| s1.size <=> s2.size }

  common_prefix = ""
  prefix = ""

  strs[0].split(//).each do |char|
    prefix += char
    break unless strs.all?{|str| str =~ /^#{prefix}/}

    common_prefix = prefix
  end

  common_prefix
end