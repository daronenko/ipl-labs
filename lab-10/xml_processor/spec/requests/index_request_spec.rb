# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Indices', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get index_output_url(format: 'html', array: '7 9 4 1 9 2 3 0 38 43')
      expect(response.content_type).to include('html')
    end
  end

  it 'should respond with RSS' do
    get index_output_url(format: 'xml', array: '74 9 6 8 29 6 83 6')
    expect(response.content_type).to include('xml')
  end
end
