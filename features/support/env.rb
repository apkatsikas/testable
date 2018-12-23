require "capybara/cucumber"
require "selenium-webdriver"
require_relative "random_util"
require_relative "wait_for_ajax"

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium_chrome
  config.app_host = "http://takehome.zeachable.com"
  config.default_max_wait_time = 5
end
