
When(/^I select Login History$/) do
  within_frame('content') do
  	click_on 'Login History'
  end
end

When(/^I select All in the dropdown$/) do
  within_frame('content') do
  	select 'All', from: 'createSinceDays'
  end
end

Then(/^I should see the user's complete login history$/) do
  within_frame('content') do
  	expect(page).to have_css('tr.header', :text => 'Completed Sessions')
  end
end
