# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'utils'

# Test '_factorial'
class TestFactorial < Minitest::Test
  def test_regular
    assert_equal 1, _factorial(0)
    assert_equal 1, _factorial(1)
    assert_equal 120, _factorial(5)
  end
end

# Test 'solve'
class TestSolve < Minitest::Test
  def test_regular
    expected = 1 / Math::E

    eps = 1e-4
    assert_in_delta expected, solve(eps), eps

    eps = 1e-5
    assert_in_delta expected, solve(eps), eps
  end
end
