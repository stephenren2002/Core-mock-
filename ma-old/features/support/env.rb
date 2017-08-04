require 'selenium/webdriver'
require 'capybara/cucumber'
#require 'sauce_whisk'

Before do | scenario |

    #CHOOSE THE APPROPRIATE ENVIRONMENT:
  	#Capybara.app_host='https://ds-testb-gdw.adminsys.mrll.com/'	#TEST GD
  	Capybara.app_host='http://ds6-stage-gdw.datasite.com/'		#STAGE GD

    Capybara.default_driver = :selenium
    Capybara.default_max_wait_time = 10

    # Capybara.register_driver :selenium do |app|
    #   capabilities = {
    #   	#TODO set these to use SAUCE_ONDEMAND_BROWSERS env var 
    #     :version => ENV['version'],
    #     :browserName => ENV['browserName'],
    #     :platform => ENV['platform'],
    #   }

    #   url = "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub".strip
    #   Capybara::Selenium::Driver.new(app,
    #    :browser => :remote, :url => url,
    #    :desired_capabilities => capabilities)
    # end

    # job = SauceWhisk::Jobs.fetch ::Capybara.current_session.driver.browser.session_id
    # job.name = "#{scenario.feature.name} - #{scenario.name}"
    # job.save
  end


  # After do | scenario |
  #   sessionid = ::Capybara.current_session.driver.browser.session_id
  #   jobname = "#{scenario.feature.name} - #{scenario.name}"

  #   puts "SauceOnDemandSessionID=#{sessionid} job-name=#{jobname}"

  #   ::Capybara.current_session.driver.quit

  #   job = SauceWhisk::Jobs.fetch sessionid
  #   job.name = jobname
  #   job.passed = scenario.passed? ? true : false
  #   job.save

  # end

# SOURCE: https://github.com/saucelabs-sample-test-frameworks/Ruby-Cucumber-Capybara
