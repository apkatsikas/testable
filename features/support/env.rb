require "capybara/cucumber"
require "selenium-webdriver"
require_relative "../../utils/random_util"

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium_chrome
  config.app_host = "http://takehome.zeachable.com"
  #fun with Amtrak WiFi!
  config.default_max_wait_time = 10
end
