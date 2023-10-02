# frozen_string_literal: true

require_relative 'utils'

print "Enter 'a': "
a = gets.chomp
print "Enter 'b': "
b = gets.chomp

puts "Result: #{f(a, b)}"
