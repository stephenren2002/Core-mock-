
Given(/^I am at the Global Dashboard Login page$/) do
  visit '/dashboard/home'
end

When(/^I enter the username "([^"]*)"$/) do |username|
  fill_in 'username', :with => username
end

When(/^I enter the password "([^"]*)"$/) do |password|
  fill_in 'password', :with => password
end

When(/^I click on Log In$/) do
	click_on 'Log In'
end

Then(/^I should see my Global Dashboard$/) do
	expect(page).to have_content('Project Name')
	expect(page).to have_content('DataSite iPad App')
	expect(page).to have_content('What\'s New at DataSite?')
	# expect(page).to have_content('What\'s New at DataSite?')
end