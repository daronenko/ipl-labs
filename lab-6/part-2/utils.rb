# frozen_string_literal: true

def _factorial(num)
  return 1 if num.zero?

  (1..num).inject(:*)
end

def solve(eps)
  expected = 1 / Math::E

  sequence = Enumerator.new do |x|
    sum = 1
    k = 0
    loop do
      sum += ((-1)**(k + 1)).to_f / _factorial(k + 1)
      x << sum
      k += 1
    end
  end

  sequence.find { |item| (expected - item).abs <= eps }
end
