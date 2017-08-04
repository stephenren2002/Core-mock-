
When(/^I search for answers submitted by the Automation Community$/) do
	expect(page).to have_content('Summary' && 'Assigned to Me' && 'Total Questions Asked Today:')
	find('#status').click
	find('.x-combo-list-item', :text => 'Answers Submitted').click
	find('#communityId').click
	find('.x-combo-list-item', :text => 'Automation Community').click
	click_on 'Search'
	end

Then(/^I should see results populate$/) do
  expect(page).to have_content ('Filter Results')
  expect(page).to have_content (questionText)
end