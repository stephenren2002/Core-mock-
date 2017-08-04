
When(/^I run Activity Timeline for all dates, all roles$/) do
	within_frame('menu') do
		find('a', :text => 'Activity Timeline').click
		find(:field, 'timelineFlag', with: '2').click
		find(:field, 'groupByFlag', with: '1').click
		within('tr', :text => 'Select all Roles')do
			find('input').click
		end
		click_on 'Generate'
	end
end

Then(/^I should see the Activity Timeline report display$/) do
	within_frame('content') do
		expect(page).to have_content 'Document Activity by Role'
	end
end