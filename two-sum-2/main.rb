# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  i = 0
  while i < numbers.size - 1
    j = i + 1
    while j < numbers.size
      # 1-indexedなのでそれぞれ+1して返す
      return [i + 1, j + 1] if numbers[i] + numbers[j] == target
      j += 1
    end
    i += 1
  end
end

p two_sum([2, 7, 11, 15], 9)
p two_sum([2, 3, 4], 6)
p two_sum([1, 2, 3, 4], 6)
p two_sum([-1, 0], -1)
