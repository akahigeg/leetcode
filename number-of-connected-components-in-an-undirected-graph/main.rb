# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def count_components(n, edges)
  n - edges.count
end

p count_components(5, []) # => 5
p count_components(5, [0, 1]) # => 4
p count_components(5, [[0, 1], [1, 2], [3, 4]]) # => 2
p count_components(5, [[0, 1], [1, 2], [2, 3], [3, 4]]) # => 1
p count_components(5, [[0, 1], [1, 2], [0, 2], [3, 4]]) # => 2
