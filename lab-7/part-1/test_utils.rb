# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'utils'

# Test 'count_words'
class TestCountWords < Minitest::Test
  @@path = './test_words.txt'

  def setup
    File.open(@@path, 'w') do |_|
    end
  end

  def teardown
    File.delete(@@path) do |_|
    end
  end

  def insert(content)
    File.open(@@path, 'w') do |file|
      file.write(content)
    end
  end

  def test_empty
    assert_equal 0, count_words(5, @@path)
  end

  def test_regular
    insert("asdf iur\nriwby\nirbfa ebr")
    assert_equal 2, count_words(5, @@path)
  end
end
