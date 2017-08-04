#########################################################################################################
# File : Common File                                                                                    #
# Author : Jagan                            Created Date : 30th Nov 2016                                #
# Modified Author : -                       Modified Date : -                                           #
# Info :   This file covers the commen methods used within the application                              #
#########################################################################################################
require 'capybara/cucumber'


#project name MUST contain the uninterrupted string "DSv6 Automation zZz" to be immediately deleted
def projectName
  dateTime = Time.new
  "DS Demo DSv6_AutomationUS1 zZz #{dateTime.strftime("%d-%b-%Y")}"
  #now =Time.now
  #now.gmtime
  #"DS Demo DSv6_AutomationRaj zZz 14-Mar-2017"
  #"DS Demo DSv6_AutomationJan zZz 29-Mar-2017"
  #global== "DS Demo DSv6_Automation zZz #{dateTime.strftime("%d-%b-%Y %H:%M")}"
 #"DS6_Automation_Ruby"
 #"DS Demo DSv6_Automation zZz 27-Mar-2017"
  #"DS Demo Raja Oct13 2016"
  #"DS Demo DSv6_Automation Chennai"
  #"DS Demo DSv6_AutomationEUGreat zZz 21-Mar-2017"
  #"Raja-Oct29-RT"
  #"Raja-Mar2 US-RT"
 #Raja-Aug17-UT"
 #"DS Demo DSv6_AutomationMarch21 zZz"

end

def currenTime
  now =Time.now
  now.gmtime.getlocal
end

#<------------------------------------------------------------------------------>
#takes snapshot for all failed scenario
After do |scenario|
=begin
  @endtime = Time.parse(Time.now.strftime("%H%M%S"))
  @consumed = @endtime-@starttime
  if scenario.start?
    @timetaken.append("#{scenario} +:+#{@consumed}")

  end
=end
  # Do something after each scenario.
  # The +scenario+ argument is optional, but
  # if you use it, you can inspect status with
  # the #failed?, #passed? and #exception methods.

  if scenario.failed?
    puts "FAILED: [DataSite MA] #{scenario.exception.message}"
    screenshotName = "#{scenario.name}.png"
    screenshotPath = File.expand_path("screenshots/" + screenshotName)
    page.save_screenshot(screenshotPath)
    #puts page.html
  end

end
#<------------------------------------------------------------------------------>

#Gets the location of the documents stored under the project for upload
def doclocation
  File.expand_path("../../uploaddoc/", __FILE__)
end

#Gets the location of the output files created
def doclocationcreate
  File.expand_path("../../test_result_report/", __FILE__)
end


#<------------------------------------------------------------------------------>
def shift_to_header_frame
  page.driver.browser.switch_to.default_content
  page.driver.browser.switch_to.frame('header')
end


#Automation Execution start time
def starttimefirst
  (Time.now.strftime("%d-%b-%Y_%H%M")).to_s
end


def time_diff(start_time, end_time)
  seconds_diff = (start_time - end_time).to_i.abs

  hours = seconds_diff / 3600
  seconds_diff -= hours * 3600

  minutes = seconds_diff / 60
  seconds_diff -= minutes * 60

  seconds = seconds_diff

  "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
end

#<------------------------------------------------------------------------------>
# Creats an output file in test result folder with Feature file name, Scenario name and time consumed for each scenario.
# Example of output file created : TimeConsumed(sec)|Feature File Name|Scenario Name
scenario_times = {}

Around() do |scenario, block|
  start = Time.now
  # start = Time.parse(Time.now.strftime("%H%M%S"))
  block.call
  # scenario_times["#{scenario.feature.file.basename}::#{scenario.name}"] = (Time.parse(Time.now.strftime("%H%M%S"))) - start
  file = scenario.feature.file
  filename = File.basename(file, '.*')
  scenario_times["#{filename}|#{scenario.name}"] = Time.now - start
end

at_exit do
  max_scenarios = scenario_times.size > 20 ? 20 : scenario_times.size
  total_scenario = scenario_times.size
  sorted_times = scenario_times.sort { |a, b| b[1] <=> a[1] } #If need to sort by time consumed in desending order .
  # sorted_times = scenario_times.sort { |a, b| a[1] <=> b[1] } #If need to sort by time consumed in ascending order.
  # sorted_times = scenario_times.sort_by {|x|[x.filename] }
  # sorted_times[0..max_scenarios - 1].each do |key, value|
  TimeConsumed = File.new("#{File.join(doclocationcreate, "Time_Consumed_#{starttimefirst}.txt")}", "a")
  sorted_times[0..total_scenario - 1].each do |key, value|
    TimeConsumed.write("#{value.round(2)}|#{key}\n")
  end
  TimeConsumed.close
end

#<------------------------------------------------------------------------------>
#<------------------------------------------------------------------------------>
#User Group user Ask Question pop up window URL
def baseAskQuestionUrl
  if $cnf['environment'] == 'testb'
    case
      when $cnf['datacenter'] == 'US'
        'https://ds6-testb-www.adminsys.mrll.com/bidder/forum/add_question_prompt.do?projectId='
      when $cnf['datacenter'] == 'EU'
        'https://ds6-testa-www.adminsys.mrll.com/bidder/forum/add_question_prompt.do?projectId='
    end

  elsif $cnf['environment'] == 'stage'
    case
      when $cnf['datacenter'] == 'US'
        'https://ds6-stage-maw.datasite.com/bidder/forum/add_question_prompt.do?projectId='
      when $cnf['datacenter'] =='EU'
        'https://ds6-eumastage-maw.datasite.com/bidder/forum/add_question_prompt.do?projectId='
    end

  elsif $cnf['environment'] == 'prod'
    case
      when $cnf['datacenter'] == 'US'
        'https://us1.merrillcorp.com/bidder/forum/add_question_prompt.do?projectId='
      when $cnf['datacenter'] == 'EU'
        'https://eu1.merrillcorp.com/bidder/forum/add_question_prompt.do?projectId='
    end

  end
end

#Site Admin See Also pop up window URL
def baseSeeAlsoUrl
  if $cnf['environment'] == 'testb'
    case
      when $cnf['datacenter'] == 'US'
        'https://ds6-testb-www.adminsys.mrll.com/bidder/forum/see_also_prompt.do?projectId='
    end

  elsif $cnf['environment'] == 'stage'
    case
      when $cnf['datacenter'] == 'US'
        'https://ds6-stage-maw.datasite.com/bidder/forum/see_also_prompt.do?projectId='
      when $cnf['datacenter'] == 'EU'
        'https://ds6-eumastage-maw.datasite.com/bidder/forum/see_also_prompt.do?projectId='
    end

  elsif $cnf['environment'] == 'prod'
    case
      when $cnf['datacenter'] == 'US'
        'https://us1.merrillcorp.com/bidder/forum/see_also_prompt.do?projectId='
      when $cnf['datacenter'] == 'EU'
        'https://eu1.merrillcorp.com/bidder/forum/see_also_prompt.do?projectId='
    end
  end
end
#<------------------------------------------------------------------------------>

def wait_until_disappears(type, name, timeout: 10)
  wait = Selenium::WebDriver::Wait.new(timeout: timeout)
  wait.until { driver.find_element(type, name).visible? }
end