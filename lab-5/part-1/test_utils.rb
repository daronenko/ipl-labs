# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'utils'

# Test `utils.rb`
class TestUtils < Minitest::Test
  def test_f
    assert_in_delta(-1.0, f(5, 9), 0.1)
    assert_in_delta(-0.9, f(8, 3), 0.1)
    assert_in_delta(0.8, f(1, 0), 0.1)
  end
end
