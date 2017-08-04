#########################################################################################################
# File : 00_02_project_select.feature                                                                   #
# Author : Jagan                            Created Date : 30th Nov 2016                                #
# Modified Author : -                       Modified Date : -                                           #
# Info :                                                                                                #
#########################################################################################################

Given(/^"([^"]*)" logged In$/) do |user|
   @user = user
  if @user == "Site Admin"
    step 'I am in Datasite Login Page'
    step 'I am logging in as a "Site Admin"'
    step 'I press the "Submit" button'
  elsif @user == "User Group"
    step 'I am in Datasite Login Page'
    step 'I am logging in as a "User Group"'
    step 'I press the "Submit" button'
  elsif @user=="Merrill User"
    step 'I am in Datasite Login Page'
    step 'I am logging in as a "Merrill User"'
    step 'I press the "Submit" button'
  end
end

When(/^I am in Global Dashboard$/) do
  puts "I have logged in as #{@user}"
end

And(/^I select the Project$/) do
  # page.fill_in('Search',:with=> projectName)
  page.click_link_or_button projectName
end

Given(/^I accept Terms and Disclaimer$/) do
if page.has_content? projectName
  # click_link projectName
  puts 'Launched inside Home page'
  else
  using_wait_time 2 do
    if page.has_content?('DataSite Terms of Use')
      click_on 'I Accept'
     end
    if page.has_content?('Disclaimer')
      click_on 'I Accept'
    end
if page.has_content? ('Notification: There are pending changes that have NOT been published to the site')
      click_on 'close'
    end
  end
end
sleep 3
#  expect(page).to have_content 'Fileroom'
 # expect(page).to have_content 'Status'
  #expect(page).to have_content 'Preferences'
  #expect(page).to have_css("span",text: projectName)
end

Then(/^I should be launched inside the project$/) do
  puts "Log:Page Current Path -#{page.current_path}"
  expect(page).to have_content projectName
  expect(page).to have_content 'Index'
end


Given(/^I move to header Frame of the page$/) do
  page.driver.browser.switch_to.default_content
  page.driver.browser.switch_to.frame 'header'
end

 Then(/^I should see all data centers in dashboard$/) do
  within(:xpath,"//table[@class='dashboard-table']") do
    i=2
    for i in 2..3
      dc=page.find(:xpath,"/html/body/div/div/div[1]/table/tbody/tr[#{i}]/td[2]").text
      puts dc
      expect(dc).eql?('US'||'EU')
    end
   end
end

