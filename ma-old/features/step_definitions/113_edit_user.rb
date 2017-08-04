
When(/^I select the user "([^"]*)"$/) do |user|
within_frame('content') do
  within('.dataSet') {find('tr', :text => user, exact: true).click}
end
end

When(/^I select role "([^"]*)"$/) do |newRole|
	within_frame ('content') do
		select newRole, from: 'workgroupId'
	end
  	#get currentRole
  	#if currentRole = User Group, select Automation Role
  	#else select User Group
end

Then(/^I should see the User details page reflecting the "([^"]*)" role change$/) do |newRole|
  within_frame ('content') do
  	expect(page).to have_content 'Role:' && newRole
  end
end