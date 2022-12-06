# @param {String[]} strs
# @return {String[][]}

# Time taken: 7 m 7 s
# Runtime 292 ms Beats 72.38%
# Memory 216.2 MB Beats 52.14%
# Runtime 428 ms Beats 51.19%
# Memory 214.4 MB Beats 80.71%
def group_anagrams(strs)
  hashmap = {}
  strs.each do |str|
    sorted = str.split(//).sort.join
    hashmap[sorted] ||= []
    hashmap[sorted] << str
  end

  hashmap.values
end

# Runtime 335 ms Beats 67.86%
# Memory 215.6 MB Beats 65.71%
def group_anagrams_with_charactor_count(strs)
  hashmap = {}

  strs.each do |str|
    counter = Array.new(26, 0)
    str.each_char do |c|
      counter[c.ord - 'a'.ord] += 1
    end

    key = counter.join(",")
    hashmap[key] ||= []
    hashmap[key] << str
  end

  hashmap.values
end

p group_anagrams(["eat","tea","tan","ate","nat","bat"])