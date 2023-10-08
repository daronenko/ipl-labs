# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'utils'

# Test 'neibr'
class TestNeibr < Minitest::Test
  def test_f1_with_lambdas
    points = [
      [0, 1], [4, -0.76], [2, -0.42], [3, 0.41], [4, -0.65],
      [5, 0.28], [4, -0.28], [6, -0.99], [5, -0.13], [9, -0.91]
    ]

    lambda_f1 = ->(x) { Math.cos(x) }

    expected = [
      true, false, true, false, true,
      true, false, false, false, true
    ]

    current_result = []
    points.each do |x, y|
      current_result << neibr(x, y, &lambda_f1)
    end

    assert_equal expected, current_result
  end

  def test_f2_with_lambdas
    points = [
      [0, 1], [4, -0.76], [2, -0.42], [3, 0.41], [4, -0.65],
      [5, 0.28], [4, -0.28], [6, -0.99], [5, -0.13], [9, -0.91]
    ]

    lambda_f2 = ->(x) { Math.sin(x**2) }

    expected = [
      false, false, false, true, false,
      false, true, true, true, false
    ]

    current_result = []
    points.each do |x, y|
      current_result << neibr(x, y, &lambda_f2)
    end

    assert_equal expected, current_result
  end

  def test_f1_with_blocks
    points = [
      [0, 1], [4, -0.76], [2, -0.42], [3, 0.41], [4, -0.65],
      [5, 0.28], [4, -0.28], [6, -0.99], [5, -0.13], [9, -0.91]
    ]

    expected = [
      true, false, true, false, true,
      true, false, false, false, true
    ]

    current_result = []
    points.each do |x, y|
      current_result << neibr(x, y) { |value| block_f1(value) }
    end

    assert_equal expected, current_result
  end

  def test_f2_with_blocks
    points = [
      [0, 1], [4, -0.76], [2, -0.42], [3, 0.41], [4, -0.65],
      [5, 0.28], [4, -0.28], [6, -0.99], [5, -0.13], [9, -0.91]
    ]

    expected = [
      false, false, false, true, false,
      false, true, true, true, false
    ]

    current_result = []
    points.each do |x, y|
      current_result << neibr(x, y) { |value| block_f2(value) }
    end

    assert_equal expected, current_result
  end
end
