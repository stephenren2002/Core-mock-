#########################################################################################################
# File : 05_ug_002_ask_attachment.feature                                                               #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Vinoth,Jagan            Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
And(/^I select the document2 in the Index$/) do
	#within(find('tr', :text => $replaceddoc2title)) {find('.x-row-checkbox').click}
	within(find('tr', :text => $data['placeholder2'])) {find('.x-row-checkbox').click}
end

And(/^I click on "([^"]*)" button in Index green bar$/) do |button|
	click_on button
end

When(/^I go to Favorites$/) do
  sleep 4
		within ('#ext-gen40') {find('span', :text => 'Favorites').click}
end

Then(/^I should see my document added to Favorites$/) do
  	expect(find('#contentPanel')).to have_css('abbr', :text => 'H')
end


