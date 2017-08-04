require 'rubygems'
require 'selenium-webdriver'
require 'capybara/cucumber'
require 'rspec/expectations'
require 'capybara/rspec'
require 'selenium/webdriver'
require 'yaml'
require 'rspec'
# require 'mail'
include RSpec::Matchers
=begin
require 'json'
require 'roo'
require "yaml/store"
require 'debase_internals'
require 'win32ole'
=end


#<----------------------End of Function---------------------->

Capybara.default_driver = :selenium
# Capybara.javascript_driver = :webkit
Capybara.javascript_driver = :selenium
Capybara.default_max_wait_time = 30
# Capybara.default_selector = :css
# Capybara.app_host='http://ds6-stage-gdw.datasite.com/'
#<----------------------End of Function---------------------->

# Data File Load
  parsed = begin
    $cnf = YAML::load_file(File.expand_path("../../../config/config.yml", __FILE__))
    $data = YAML::load_file(File.expand_path("../../src/01_data_feeder.yml", __FILE__))
    # $data = YAML::load_file(File.join(doclocation,'01_data_feeder.yml'))
    rescue ArgumentError => e
    puts "Could not parse YAML: #{e.message}"
  end
#<----------------------End of Function---------------------->

#Internet Explorer Drive initialization
    Capybara.register_driver :selenium do |app|
      brw = $cnf['browser_Launch']
      puts "Browser Launched: "+ brw
         case brw
          when brw = "ie"
            Capybara::Selenium::Driver.new(app,:browser=>:internet_explorer)
          when brw ='firefox'
            Capybara::Selenium::Driver.new(app,:browser=>:firefox)
          when brw = 'chrome'
            Capybara::Selenium::Driver.new(app,:browser=>:chrome,:switches => ['--disable-extensions'])
         end

    end
# <----------------------End of Function---------------------->

#Prevents the browser quit

    Selenium::WebDriver::Driver.class_eval do
      def quit
        STDOUT.puts "#{self.class}#Browser will not be Quited!!!"
      end
    end
    Capybara::Selenium::Driver.class_eval do
      def reset!
      end
    end
#<----------------------End of Function---------------------->

# def cucumber_file
#   @cucumber_file ||= Dir.glob('{,.config/,config/}cucumber{.yml,.yaml}').first
# end

#<----------------------End of Function---------------------->

#<----------------------End of Function---------------------->