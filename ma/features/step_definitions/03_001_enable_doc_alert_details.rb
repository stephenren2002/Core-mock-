#########################################################################################################
# File : 04_001_01_enable_doc_alert_details.feature                                                     #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Siva,Jagan              Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I go to the Settings tab$/) do
  within ('.tabs-btn-top') {click_on 'Settings'}
end

When(/^I click on "([^"]*)" in left panel of settings tab$/) do |option|
  within ('.navTree') {click_on option}
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


