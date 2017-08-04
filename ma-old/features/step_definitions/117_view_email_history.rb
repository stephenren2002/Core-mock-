
When(/^I select Email History$/) do
  within_frame('content') do
  	click_on 'Email History'
  end
end

Then(/^I should see the user's email history$/) do
  within_frame('content') do
  	expect(page).to have_css('tr.header', :text => 'Date' && 'Email' && 'Sent From')
  end
end
