# frozen_string_literal: true

require 'minitest/autorun'
require 'date'
require_relative 'utils'

# Test 'utils.rb'
class TestUtils < Minitest::Test
  def test_get_closest_date1
    dates = ['2022-5-14', '2023-2-7', '2023-6-29', '2022-3-28']
    target_date = Date.today
    assert_equal '2023-6-29', get_closest_date(dates, target_date)
  end

  def test_get_closest_date2
    dates = ['2022-5-14', '2023-11-4', '2023-6-29']
    target_date = Date.today
    assert_equal '2023-11-4', get_closest_date(dates, target_date)
  end

  def test_get_closest_date3
    dates = ['2023-10-3', '1998-3-5', '1965-2-19']
    target_date = Date.today
    assert_equal '2023-10-3', get_closest_date(dates, target_date)
  end
end
