require_relative "sauce_capybara_driver"

# Saucelabs config: Wrap each scenario in a saucelabs session.
Around do |scenario, block|
  block.call
  ::Capybara.current_session.driver.quit
end

# Default browser/OS
desired_capabilities = Selenium::WebDriver::Remote::Capabilities.chrome
desired_capabilities.version = '39'
desired_capabilities.platform = 'Windows 7'
desired_capabilities[:name] = 'Testing Selenium 2 with Ruby on Sauce'
