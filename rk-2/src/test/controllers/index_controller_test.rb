# frozen_string_literal: true

require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get index_input_url
    assert_response :success
  end

  test 'should get view' do
    get index_view_url
    assert_response :success
  end
end
