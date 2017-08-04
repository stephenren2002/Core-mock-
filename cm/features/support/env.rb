ruby_env = ENV['ruby_env']
require 'capybara/cucumber'
require 'byebug'
require_relative 'mail_helper'
require_relative 'alf_js_helper'
require_relative 'actions'
require "#{File.dirname(__FILE__)}/../../#{ruby_env}"

Capybara.configure do |config|
  config.default_driver = :selenium
  config.default_max_wait_time = 10
  config.app_host = "https://datasite-stage.ber1.mrll.com/ds/r/tracker"
  CAPYBARA_CONFIG.each { |key, value| config.send("#{key}=", value) }
  puts "Running against: #{config.app_host}"
end

After do |scenario|
  # Do something after each scenario.
  # The +scenario+ argument is optional, but
  # if you use it, you can inspect status with
  # the #failed?, #passed? and #exception methods.
  if scenario.failed?
    puts "FAILED: [DataSite CM] #{scenario.exception.message}"
    screenshot = File.expand_path("../screenshot.png", __FILE__)
    page.save_screenshot(screenshot)
    # puts page.html
  end
  screenshot = File.expand_path("../screenshot.png", __FILE__)
  page.save_screenshot(screenshot)
end

# Capybara.register_driver :selenium do |app|
#   profile = Selenium::WebDriver::Firefox::Profile.new
#
#   profile["network.proxy.type"] = 1 # manual proxy config
#   profile["network.proxy.http"] = "http://example.com"
#   profile["network.proxy.http_port"] = 80
#
#   Capybara::Selenium::Driver.new(app, :profile => profile)
# end