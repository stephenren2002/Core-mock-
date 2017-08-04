#########################################################################################################
# File : 01_002_edit_proj_info.feature                                                                  #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I click the Add Contact button$/) do
	click_on 'addContactButton'
end

When(/^I search the Contact: field with "([^"]*)"$/) do |contactSearch|
	fill_in 'contactSearchName', :with => contactSearch
end

When(/^I select "([^"]*)" from the dropdown$/) do |contactSelect|
	find('#ui-id-1 .ui-menu-item', :text => contactSelect).click
end

When(/^I click Save \(tracker\)$/) do
	sleep(3.to_i) #pause seems to prevent the "person does not exist in current dc" popup
	click_on 'Save'
end

Then(/^I should see the contact added to the project's Tracker page$/) do
	within('#contactsSection') {expect(page).to have_content('House Account')}
	within('#contactsSection') {expect(page).to have_content('Can Approve:')}
end

Then(/^the contact's email should be "([^"]*)"$/) do |contactEmail|
	within('#contactsSection') {expect(page).to have_content('Email:' && contactEmail)}
end
