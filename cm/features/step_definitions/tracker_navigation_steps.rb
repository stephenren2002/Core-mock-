Transform /^user :(\w+)$/ do |user|
  USERS[user.to_sym]
end

Given(/^I am logged in as an internal (user :(?:\w+))$/) do |user|
  steps %Q{
    And I go to the internal login page
    And I enter login credentials for #{user[:login]} with #{user[:pw]}
  }
end

And(/^I go to the internal login page$/) do
  visit "/login?_alfRedirect=%2Fds%2Fr%2Ftracker"
  #expect(page).to have_selector('span.x-panel-header-text', :text => 'Login')
end

Given(/^I go to the tracker "([^"]*)" tab$/) do |tab_name|
  click_on tab_name
  expect(page).to have_selector('span.x-tab-strip-text', :text => tab_name)
end