require 'capybara/cucumber'
require 'yaml'
class Local_helper
  include Capybara::DSL
  include Capybara::Node

$starttime = starttimefirst
#<------------------------------------------------------------------------------>
=begin
  def wait_for_element_present(how_long)
    # wait_for_it =
    Selenium::WebDriver::Wait.new(:timeout => how_long)
    # wait_for_it.until { @browser.find_element(how, what) }
  end


  def url
    URI.parse(current_url).request_uri
  end
=end

#<------------------------------------------------------------------------------>
#Logging Off the datasite
  def self.closebrowser
    Capybara.page.driver.browser.close
  end

  #<----------------------$Class Ends$-------------------------------------------------------->
end

