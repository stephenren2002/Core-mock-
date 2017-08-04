
When(/^I click Submit & Auto\-Approve$/) do
	within_frame('content') do
  find('a', :text => 'Submit & Auto-Approve').click
end
end

Then(/^I should return to the Session Locks screen and see no sessions$/) do
  within_frame('content') do
  	expect(page).to have_css('li', :text => 'Reports')
  	expect(page).to have_content 'Results: 0'
  end
end