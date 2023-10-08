# frozen_string_literal: true

require_relative 'utils'

points = [
  [0, 1], [4, -0.76], [2, -0.42], [3, 0.41], [4, -0.65],
  [5, 0.28], [4, -0.28], [6, -0.99], [5, -0.13], [9, -0.91]
]

lambda_f1 = ->(x) { Math.cos(x) }
lambda_f2 = ->(x) { Math.sin(x**2) }

puts 'Lambdas:'

points.each do |x, y|
  result = neibr(x, y, &lambda_f1)
  puts "(#{x}, #{y}) belongs to y = cos(x)? - #{result}"
end

puts '-' * 45

points.each do |x, y|
  result = neibr(x, y, &lambda_f2)
  puts "(#{x}, #{y}) belongs to y = sin(x^2)? - #{result}"
end

puts "\n\nBlocks:"

points.each do |x, y|
  result = neibr(x, y) { |value| block_f1(value) }
  puts "(#{x}, #{y}) belongs to y = cos(x)? - #{result}"
end

puts '-' * 45

points.each do |x, y|
  result = neibr(x, y) { |value| block_f2(value) }
  puts "(#{x}, #{y}) belongs to y = sin(x^2)? - #{result}"
end
