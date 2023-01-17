# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine(n, k)
  result = []

  i = 1
  while i <= n
    j = i + 1
    while j <= n
      result << [i, j]
      j += 1
    end
    i += 1
  end

  result
end

p combine(4, 2)
p combine(2, 1)
p combine(1, 1)
