
When(/^I go to Users via the left pane$/) do
  within_frame('menu') do
  	click_on 'Users'
  end
end

When(/^I select the user with email address of "([^"]*)"$/) do |userEmail|
  within_frame('content') do
  	within('table#dataSet')	{find('td', :text => 'dsv6.automation@gmail.com', exact: true).click}
  end
end

Then(/^I should see the details page of user with email address "([^"]*)"$/) do |userEmail|
	within_frame('content') do
		expect(page).to have_content 'E-mail:' && userEmail
		expect(page).to have_content 'Role:'
		expect(page).to have_content 'Challenge:'
	end
end