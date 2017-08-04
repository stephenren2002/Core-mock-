Given(/^a user "([^"]*)" exists$/) do |username|
  #visit "http://admin:admin@dev1:8080/ds/service/enterprise/admin/admin-nodebrowser"
  visit "http://admin:Blues123@ds-stage-cms1-1.dmzber1.mrll.com:8080/ds/service/enterprise/admin/admin-nodebrowser"
  select 'lucene', :from => 'nodebrowser-search'
  query = "TYPE:\"cm:person\" AND PATH:\"/app:company_home//./tracker:internalUserRoot//.\" AND @cm\\:email:\"#{username}\""
  fill_in 'nodebrowser-query', :with => query
  click_on 'Execute'
  click_on 'Execute'
  header = find 'h2', :text => 'Results'
  check_text = /Results \(1\)/

  while (header.text =~ check_text).nil? do
    click_on 'Execute'
  end
  expect(header.text).to match(check_text)
end

When(/^I enter my login credentials$/) do
  fill_in 'User name:', :with => 'seluser'
  fill_in 'Password:', :with => 'Seluser13'
  click_on 'Login'
end

When(/^I enter login credentials for ([^"]*) with ([^"]*)$/) do |login, pw|
  fill_in 'User name:', :with => login
  fill_in 'Password:', :with => pw
  click_on 'Login'
end

Then(/^I should see the tracker page$/) do
  expect(page).to have_selector('button', :text => '( Logout )')
  expect(page).to have_current_path('/ds/r/tracker')
end

When(/^I enter the user "([^"]*)" information$/) do |username|
  within('#trackerProfilingTabPanel') do
    find(".x-toolbar .x-btn-text", :text => 'New').click
  end
  find(".x-menu-list span.x-menu-item-text", :text => 'Add Merrill Administrator').click
  expect(page).to have_selector('.x-window')
  within('.x-window form') do
    fill_in '* Login Name:', :with => username
    fill_in '* First Name:', :with => 'Selenium'
    fill_in '* Last Name:', :with => 'User'
    find('input[name=\'authorityName\'] ~img').click
  end
  find('.x-combo-list-item', :text => 'Project Manager').click
  # select 'Project Manager', :from => '* Team:'
  click_on 'Submit'
end

Then(/^the user "([^"]*)" should be created$/) do |username|
  browser = Capybara.current_session.driver.browser
  browser.manage.delete_all_cookies
  step 'a user "seluser" exists'
end

Given(/^a user new user has been invited to tracker$/) do
  increment = '34'
  @username = "testpm#{increment}"
  @password = @username.capitalize + '15'

  puts "Invited user: #{@username} with password: #{@password}"

  steps %{
    Given a user "DataSiteITServices" exists
    And I go to the tracker profiling tab
    When I enter the user "#{@username}" information
    Then the user "#{@username}" should be created
    And a user "#{@username}" exists
  }
end

And(/^the new user goes to the registration link in the email$/) do
  mail = MailHelper::get_last_email_url_by_user @username
  visit mail
  @link = find("span.fields[field='com.merrillcorp.datasite.template.variable.PasswordResetUrl']").text
  @confirmation_code = find("span.fields[field='com.merrillcorp.datasite.template.variable.EmailConfirmationCode']").text
  puts @link
  expect(@link).not_to be_empty
  expect(@confirmation_code).not_to be_empty
end

When(/^I enter the new user registration information$/) do
  visit @link
  fill_in 'confirmationCode', :with => @confirmation_code
  fill_in 'newPasswordText', :with => @password
  fill_in 'confirmPasswordText', :with => @password
  click_on 'Submit'
  expect(page).to have_selector 'label#authenticationUserMessage', :text => 'successful'
end

Then(/^the new user should be registered$/) do
  visit "/login?_alfRedirect=%2Fds%2Fr%2Ftracker"
  expect(page).to have_selector('span.x-panel-header-text', :text => 'Login')
  fill_in 'User name:', :with => @username
  fill_in 'Password:', :with => @password
  click_on 'Login'
end