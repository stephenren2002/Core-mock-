
When(/^I click Change to Previous Status$/) do
  within_frame('content') do
  	click_on 'Change to Previous Status'
  end
end

Then(/^I should see confirmation that the user is in an enabled status$/) do
  within_frame ('content')do
  expect(page).to have_content 'Processed Records'
  expect(page).to have_content 'has been successfully Activated and returned to an Enabled Status'
end
end