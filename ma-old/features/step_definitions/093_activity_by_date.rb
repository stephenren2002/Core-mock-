
When(/^I go to the Reports tab$/) do
	within('.tabs-btn-top') {click_on 'Reports'}
end

When(/^I run Activity by Date for all dates$/) do
	within_frame 'menu' do
		find('a', :text => 'Activity By Date').click
		find(:field, 'timelineFlag', with: '2').click
		click_on 'Generate'
	end
end

Then(/^I should see the Activity by Date report display$/) do
	within_frame 'content' do
		expect(page).to have_content 'Date Range:' && 'All Dates'
		expect(page).to have_css('th', :text => 'Login Count')
		expect(page).to have_css('th', :text => 'Time Connected')
		expect(page).to have_css('th', :text => 'Total Documents')
		expect(page).to have_css('th', :text => 'Unique Documents Accessed')
		expect(find('.footerRow')).to have_css('td', :text => 'Totals:')
	end
end
