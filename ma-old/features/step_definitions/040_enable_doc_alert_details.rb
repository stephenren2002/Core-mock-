When(/^I go to the Settings tab$/) do
  within ('.tabs-btn-top') {click_on 'Settings'}
end

When(/^I click on Project Administration$/) do
  within ('.navTree') {click_on 'Project Administration'}
end

When(/^I click Edit$/) do
  click_on 'Edit'
end

When(/^in the Email Alerts dropdown I select Detailed Alerts$/) do
  select 'Detailed Alerts', from: 'emailAlert'
end

When(/^I click Save$/) do
	click_on 'Save'
end

Then(/^I should see the Email Alerts Details field as Yes$/) do
 within ('#content') {expect(page).to have_content ('Email Alerts - Show Details: ' && 'Yes')}
end
