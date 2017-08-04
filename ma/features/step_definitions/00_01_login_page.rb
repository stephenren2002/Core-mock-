#########################################################################################################
# File : 00_02_project_select.feature                                                                   #
# Author : Jagan                            Created Date : 30th Nov 2016                                #
# Modified Author : -                       Modified Date : -                                           #
# Info :                                                                                                #
#########################################################################################################

include Capybara::Node
include Capybara::Node::Matchers


Given(/^I am in Datasite Login Page$/) do
  env = $cnf['environment']
  case env
    when env = 'stage'
      puts 'Log:i have launched stage URL'
      visit $cnf['stage']
    when env = 'testb'
      puts 'Log:i have launched stage URL'
      visit $cnf['testb']
    when env = 'prod'
      visit $cnf['prod']
    when env = 'stage2'
      visit $cnf['stage2']
  end
  puts "URL Launching: #{env} "
  Capybara.page.driver.browser.manage.window.maximize
end


When(/^I am logging in as a "([^"]*)"$/) do |user|
  user=user.delete(' ')
  case
    when user.downcase == 'merrilluser'
      page.fill_in('username', :with => '')
      page.fill_in('username', :with => $cnf['muusername'])
      page.fill_in('password', :with => '')
      page.fill_in('password', :with => $cnf['mupassword'])
      puts "Log: Logging in as a Merrill User"
    when user.downcase == 'siteadmin'
      page.fill_in('username', :with => '')
      page.fill_in('username', :with => $cnf['sausername'])
      page.fill_in('password', :with => '')
      page.fill_in('password', :with => $cnf['sapassword'])
    when user.downcase == 'usergroup'
      page.fill_in('username', :with => '')
      page.fill_in('username', :with => $cnf['ugusername'])
      page.fill_in('password', :with => '')
      page.fill_in('password', :with => $cnf['ugpassword'])
  end
end

And(/^I press the "([^"]*)" button$/) do |loginbutton|
  if loginbutton.match "Submit"
  page.click_button('Log In')
  end

end

Then(/^I should be in "([^"]*)" Global Dashboard$/) do |dashboard|
  # @@localhelp.wait_till dashboard
  # puts @@localhelp.url
  expect(page).to have_link ('Switch To Mobile User Manager')
  expect(page).to have_content ('Project Name')
end


Given(/^"([^"]*)" is on Home Page$/) do |userlaunch|
  case
    when userlaunch == 'Site Admin'
      step '"Site Admin" logged In'
      step 'I select the Project'
      step 'I accept Terms and Disclaimer'
    when userlaunch == 'User Group'
      step '"User Group" logged In'
      step 'I select the Project'
      step 'I accept Terms and Disclaimer'
    when userlaunch == 'Merrill User'
      step '"Merrill User" logged In'
      step 'I select the Project'
    when userlaunch == 'Tracker'
      step '"Merrill User" logged In'
      step "I am on a project's Tracker page"
  end
end

When(/^I click on "([^"]*)" tab$/) do |tabclick|
  @tabclick =tabclick
  # puts @tabclick
  page.click_link(@tabclick)
  # puts "I am inside #{@tabclick}"   #To Debug
  page.driver.browser.switch_to.default_content
  if @tabclick == "Content Manager"||@tabclick == "Session Locks"||@tabclick == "Users"||@tabclick == "Reports"
    page.driver.browser.switch_to.default_content
    page.driver.browser.switch_to.frame('header')
  end
end

When(/^Merrill User click on "([^"]*)" tab$/) do |tabclick|
  # within_window(->{ page.title == projectName + ' - DataSite' }) do
  within_window windows.last do
    @tabclick =tabclick
    page.click_link(@tabclick)
    # puts "I am inside if condition #{@tabclick}" #To Debug
    page.driver.browser.switch_to.default_content
    if @tabclick == "Content Manager"||@tabclick == "Users"||@tabclick == "Reports"
      page.driver.browser.switch_to.default_content
      page.driver.browser.switch_to.frame('header')
    end
  end
end
