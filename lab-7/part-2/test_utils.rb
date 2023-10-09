# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'utils'

# Test 'Window'
class TestWindow < Minitest::Test
  def test_square
    window = Window.new(5, 6)
    assert_equal 30, window.square
  end

  def test_negative_width
    assert_raises TypeError do
      Window.new(4, -2)
    end
  end

  def test_negative_height
    assert_raises TypeError do
      Window.new(-4, 2)
    end
  end

  def test_zero
    assert_raises TypeError do
      Window.new(0, 4)
    end
  end

  def test_boolean
    assert_raises TypeError do
      Window.new(5, false)
    end
  end
end

# Test 'AdvancedWindow'
class TestAdvancedWindow < Minitest::Test
  def test_jalousie
    assert_equal true, AdvancedWindow.new(5, 6, true).jalousie?
  end

  def test_jalousie_invalid_type
    assert_raises TypeError do
      AdvancedWindow.new(5, 6, 1)
    end
  end
end
