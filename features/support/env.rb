require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rspec'

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium_chrome
  config.app_host = 'http://takehome.zeachable.com'
  config.default_max_wait_time = 5
end
