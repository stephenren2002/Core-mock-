
When(/^I click Deactivate$/) do
  within_frame ('content') do
  	click_on 'Deactivate'
  	#Accept confirmation popup
  	 page.driver.browser.switch_to.alert.accept 
  end
end

Then(/^I should see confirmation that the user is in a disabled status$/) do
  within_frame('content') do
  	expect(page).to have_content 'Processed Records'
  	expect(page).to have_content 'has been moved to a Disabled Status'
  end
end
