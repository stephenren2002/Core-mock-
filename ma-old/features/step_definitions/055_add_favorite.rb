
When(/^I add a document to my favorites$/) do
	within(find('tr', :text => phNameTwo)) {find('.x-row-checkbox').click}
		click_on 'Add to Favorites' 	
end

When(/^I go to Favorites$/) do
		within ('#ext-gen46') {find('span', :text => 'Favorites').click}
end

Then(/^I should see my document added to Favorites$/) do
  	expect(find('#contentPanel')).to have_css('abbr', :text => 'H')
end
