require 'selenium-webdriver'
require 'json'

describe 'Onenumber' do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'onenumber' do
    @driver.get('http://localhost:3000/')
    @driver.find_element(:id, 'array').click
    @driver.find_element(:id, 'array').send_keys('1')
    @driver.find_element(:name, 'commit').click
    sleep(0.2)
    expect(@driver.find_element(:id, 'result_table').text).to eq('Longest Sequence: Not Found')
  end
end
