require 'selenium-webdriver'
require 'json'

describe 'Regular' do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'regular' do
    @driver.get('http://localhost:3000/')
    @driver.find_element(:id, 'array').send_keys('3 6 5 17 26 21 9 15 7')
    @driver.find_element(:name, 'commit').click
    sleep(0.2)
    html_content = @driver.find_element(:id, 'result_table')['innerHTML']
    expect(html_content).to include('<tr><td>Sequence Found:</td><td>3 6</td></tr><tr><td>Sequence Found:</td><td>5 17 26</td></tr><tr><td>Sequence Found:</td><td>9 15</td></tr><tr><td>Longest Sequence:</td><td>5 17 26</td></tr>')
  end
end
