# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.nil? || strs.size.zero?

  common_prefix = ""
  strs.sort!{|s1, s2| s1.size <=> s2.size }
  prefix = ""
  strs[0].split(//).each do |char|
    prefix = prefix += char
    break if strs.select{|str| str =~ /^#{prefix}/}.size != strs.size

    common_prefix = prefix
  end

  common_prefix
end

p longest_common_prefix(["flower","flow","flight"])