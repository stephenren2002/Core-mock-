#########################################################################################################
# File : 01_002_edit_proj_info.feature                                                                  #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I click Edit in the Project Details section$/) do
  click_on 'bEditProjectDetails'
end

When(/^I select "([^"]*)" in the Live Chat dropdown$/) do |liveChat|
  select liveChat, from: 'liveChatState'
end

When(/^I set the Page Threshold to "([^"]*)"$/) do |pageThreshold|
  fill_in 'pageThreshold', :with => pageThreshold
end

When(/^I click the Submit \(tracker\)$/) do
  click_on 'bSubmitCheckRequiredFields'
end

Then(/^I should see Live Chat updated to "([^"]*)"$/) do |liveChat|
  expect(page).to have_content ('LiveChat: ' && liveChat)
end

Then(/^I should see the Page Threshold updated to "([^"]*)"$/) do |pageThreshold|
  expect(page).to have_content ('Page Threshold: ' && pageThreshold)
end


And(/^I set the HTML uploader as default$/) do
  find(:css,'[name=htmlUploaderEnabled][value=true]').click
  # choose 'Html5'
end