require 'test_helper'

class CalcControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get calc_input_url
    assert_response :success
  end

  test 'should get view' do
    get calc_view_url
    assert_response :success
  end

  test 'should get 5 6 8 for view with 5 6 8 5 6 3' do
    get calc_view_url, params: { array: '5 6 8 5 6 3' }
    assert_equal assigns[:longest_sequence], %w[5 6 8]
  end

  test 'should get unknown for view with letters' do
    get calc_view_url, params: { array: 'j 3 5 e 4' }
    assert_equal assigns[:longest_sequence], []
  end

  test 'should get unknown for view with empty array' do
    get calc_view_url, params: { array: '' }
    assert_equal assigns[:longest_sequence], []
  end
end
