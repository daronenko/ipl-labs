# frozen_string_literal: true

require_relative 'utils'

SEPARATOR = '-' * 30

print 'Strings count: '
strings_count = gets.to_i

strings = input(strings_count)

puts SEPARATOR
puts 'Source text:'
show strings

corrections_count = fix_text(strings)

puts SEPARATOR
puts "Fixed text (corrections: #{corrections_count}):"
show strings
