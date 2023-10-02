# frozen_string_literal: true

require 'date'
require_relative 'utils'

print 'Enter dates in ISO format: '
dates = gets.chomp.split

today = Date.today
puts "Closest date: #{get_closest_date(dates, today)}"
