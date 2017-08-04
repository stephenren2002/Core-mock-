require 'capybara/cucumber'
require 'selenium/webdriver'
Capybara.default_driver=:selenium
Capybara.default_max_wait_time=10
Capybara.app_host='http://javelin-frontend.apps.javelinmc.com'

# Saucelabs stuff: Enable this to use saucelabs
# You must have the SAUCE_USERNAME and SAUCE_ACCESS_KEY environment variables set
#require_relative "../../saucelabs/remote_setup"
