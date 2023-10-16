require 'selenium-webdriver'
require 'json'

describe 'Empty' do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'empty' do
    @driver.get('http://localhost:3000/')
    @driver.find_element(:id, 'array').click
    @driver.find_element(:name, 'commit').click
    expect(@driver.switch_to.alert.text).to eq('Enter the array of numbers!')
  end
end
