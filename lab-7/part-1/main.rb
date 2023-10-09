# frozen_string_literal: true

require_relative 'utils'

generate_words('words.txt')
puts "Words with a length of 5: #{count_words(5, 'words.txt')}"
