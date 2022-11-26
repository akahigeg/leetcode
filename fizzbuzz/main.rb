# @param {Integer} n
# @return {String[]}
# Runtime: 158 ms, faster than 73.94% of Ruby online submissions for Fizz Buzz.
# Memory Usage: 214 MB, less than 75.64% of Ruby online submissions for Fizz Buzz.
def fizz_buzz(n)
  result = []
  (1..n).each do |i|
    if i % 3 == 0 && i % 5 == 0
      result.push("FizzBuzz")
    elsif i % 3 == 0
      result.push("Fizz")
    elsif i % 5 == 0
      result.push("Buzz")
    else
      result.push(i.to_s)
    end
  end

  result
end

p fizz_buzz(15)
p fizz_buzz(6)
p fizz_buzz(20)
p fizz_buzz(1)
p fizz_buzz(2)
