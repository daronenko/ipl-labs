# frozen_string_literal: true

require_relative 'utils'

eps = 1e-4
puts "#{solve(eps)} (eps = #{eps})"

eps = 1e-5
puts "#{solve(eps)} (eps = #{eps})"
