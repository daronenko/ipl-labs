# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'utils'

# Test 'fix_text' function
class TestFixText < Minitest::Test
  def test_some_text
    strings = [
      %w[j4hk jh$j4f4 5owbe3],
      %w[3qn43 ie&1df]
    ]
    assert_equal 4, fix_text(strings)
    assert_equal [%w[j4hk _owbe3], ['_qn43']], strings
  end

  def test_emtpy_text
    strings = [[]]
    assert_equal 0, fix_text(strings)
    assert_equal [[]], strings
  end

  def generate_random_word
    chars = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a + ['_', '!', '@', '#', '$', '%', '^', '&', '*']

    len = rand(15)
    word = ''
    len.times do
      word += chars.sample.to_s
    end

    word
  end

  def generate_random_strings
    strings = []

    rand(15).times do
      new_strings = []
      rand(15).times do
        new_strings.push(generate_random_word)
      end
      strings.push(new_strings)
    end

    strings
  end
end
