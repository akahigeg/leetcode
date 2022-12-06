# @param {String[]} strs
# @return {String[][]}

# Time taken: 7 m 7 s
# Runtime 292 ms Beats 72.38%
# Memory 216.2 MB Beats 52.14%
def group_anagrams(strs)
  hashmap = {}
  strs.each do |str|
    sorted = str.split(//).sort.join
    hashmap[sorted] ||= []
    hashmap[sorted] << str
  end

  hashmap.map{|h| h[1] }
end

p group_anagrams(["eat","tea","tan","ate","nat","bat"])