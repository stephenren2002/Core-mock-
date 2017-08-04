require 'capybara/cucumber'

#ADJUST BASED ON TEST NEED
def dataCenter
  'US'
  #'EU'
  #'AP'
end

def merrillLogin
  "dsv6automation"
end
def merrillPW
  "DataSite0"
end

Before('@MerrillUser') do
  # Login as Merrill User
  visit "/dashboard/home"
  curPath = current_path
  if curPath.include? "oauth2"
    fill_in 'username', :with => merrillLogin
    fill_in 'password', :with => merrillPW
    click_on 'Log In'
  end
end

def siteAdminLogin
  "dsv6.automation@gmail.com"
end
def siteAdminPW
  "DataSite0"
end

Before('@SiteAdmin') do
# Login as Site Admin
visit "/dashboard/home"
curPath = current_path
if curPath.include? "oauth2"
  fill_in 'username', :with => siteAdminLogin
  fill_in 'password', :with => siteAdminPW
  click_on 'Log In'
end
end

def userLogin
  "dsv6.automation+user@gmail.com"
end
def userPW
  "DataSite0"
end

Before('@User') do
  # Login as User
  visit "/dashboard/home"
  curPath = current_path
  if curPath.include? "oauth2"
    fill_in 'username', :with => userLogin
    fill_in 'password', :with => userPW
    click_on 'Log In'
  end
end

#project name MUST contain the uninterrupted string "DSv6 Automation zZz" to be immediately deleted
def projectName
  dateTime = Time.new
  "DS Demo DSv6 Automation zZz #{dateTime.strftime("%d %b %Y")}"
end

def fileroomName
  "Fileroom"
end

def folderName
  "Auto Folder"
end

def editedFolder
  "Folder name has been edited"
end

def phNameOne
  "First Placeholder"
end

def phNameTwo
  "Second Placeholder"
end

def roleName
  "Automation Role"
end

def teamName
  "Automation Team"
end

def communityName
  "Automation Community"
end

def questionText
  "When will this document be updated?"
end

def answerText
  "Definitely"
end

def searchTerm
  "political"
end

def draftQuestion
  "This question isn't quite ready yet."
end

def editDraftQuestion
  "Now this question is ready to submit."
end

def adminEmail
  "dsv6.automation@gmail.com"
end

def userEmail
  "dsv6.automation+user@gmail.com"
end

#url for given enviro's project ask question window, removing projectID
def baseAskQuestionUrl
  if Capybara.app_host == 'https://ds-testb-gdw.adminsys.mrll.com/' && dataCenter == 'US'
    'https://ds6-testb-www.adminsys.mrll.com/bidder/forum/add_question_prompt.do?projectId='
  elsif Capybara.app_host == 'http://ds6-stage-gdw.datasite.com/' && dataCenter == 'US'
    'https://ds6-stage-maw.datasite.com/bidder/forum/add_question_prompt.do?projectId='
  elsif Capybara.app_host == 'http://ds6-stage-gdw.datasite.com/' && dataCenter =='EU'
    'https://ds6-eumastage-maw.datasite.com/bidder/forum/add_question_prompt.do?projectId='
  end
end

#url for given enviro's add see also window, removing projectID
def baseSeeAlsoUrl
  if Capybara.app_host == 'https://ds-testb-gdw.adminsys.mrll.com/' && dataCenter == 'US'
    'https://ds6-testb-www.adminsys.mrll.com/bidder/forum/see_also_prompt.do?projectId='
  elsif Capybara.app_host == 'http://ds6-stage-gdw.datasite.com/' && dataCenter == 'US'
    'https://ds6-stage-maw.datasite.com/bidder/forum/see_also_prompt.do?projectId='
  elsif Capybara.app_host == 'http://ds6-stage-gdw.datasite.com/' && dataCenter =='EU'
    'https://ds6-eumastage-maw.datasite.com/bidder/forum/see_also_prompt.do?projectId='
  end
end

#url for given enviro's tracker edit primary project info section, removing projectID
def baseEditPrimaryInfoUrl
  if Capybara.app_host == 'https://ds-testb-gdw.adminsys.mrll.com/' && dataCenter == 'US'
    'https://ds6-testb-tracker.adminsys.mrll.com/datasite/project/project_primary_info_prompt.do?projectId='
  elsif Capybara.app_host == 'http://ds6-stage-gdw.datasite.com/' && dataCenter == 'US'
    'https://ds6-stage-tracker.datasite.com/datasite/project/project_primary_info_prompt.do?projectId='
  elsif Capybara.app_host == 'http://ds6-stage-gdw.datasite.com/' && dataCenter =='EU'
    'https://ds6-eumastage-tracker.datasite.com/datasite/project/project_primary_info_prompt.do?projectId='
  end
end



After do |scenario|

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

  # Logout
  visit "/dashboard/home"
  click_on 'Log Off'
  click_on 'Yes'
end
