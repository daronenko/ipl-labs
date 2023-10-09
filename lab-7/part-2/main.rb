# frozen_string_literal: true

require_relative 'utils'

window = Window.new(5, 6)
puts "square? #{window.square}"

advanced_window = AdvancedWindow.new(5, 6, true)
puts "jalousie? #{advanced_window.jalousie?}"
