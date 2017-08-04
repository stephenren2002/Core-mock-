
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
