# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}

# ref: https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/solutions/2842583/ruby-solution-with-union-find-short-and-easy/
# Runtime 105 ms Beats 85.71%
# Memory 211.6 MB Beats 78.57%
def count_components(n, edges)
  parents = n.times.map { |i| [i, i] }.to_h
  size = n
  edges.each do |from, to|
    size -= 1 if union(from, to, parents)
  end

  size
end

def union(from, to, parents)
  p, q = find(from, parents), find(to, parents)
  return false if p == q

  parents[p] = q
end

def find(vertex, parents)
  parents[vertex] = find(parents[vertex], parents) if parents[vertex] != vertex
  parents[vertex]
end

p count_components(5, []) # => 5
p count_components(5, [[0, 1]]) # => 4
p count_components(5, [[0, 1], [1, 2], [3, 4]]) # => 2
p count_components(5, [[0, 1], [1, 2], [2, 3], [3, 4]]) # => 1
p count_components(5, [[0, 1], [1, 2], [0, 2], [3, 4]]) # => 2
