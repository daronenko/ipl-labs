# frozen_string_literal: true

def _factorial(num)
  return 1 if num.zero?

  result = 1
  (1..num).each do |i|
    result *= i
  end

  result
end

def solve(eps)
  expected = 1 / Math::E

  sum = 1
  k = 0
  loop do
    sum += ((-1)**(k + 1)).to_f / _factorial(k + 1)
    k += 1
    break if (expected - sum).abs <= eps.to_f
  end

  sum
end
