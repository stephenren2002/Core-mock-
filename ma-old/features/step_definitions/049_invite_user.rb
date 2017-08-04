
When(/^I click Add User$/) do
  within_frame('content') do
  	click_on 'Add User'
  end
end

When(/^I invite a User Group type user$/) do
	within_frame('content') do
		select roleName, from: 'workgroupId'
  	#if to handle unloaded fr warning if one is present on project
  	select teamName, from: 'projectGroupId'
  	select communityName, from: 'communityId'
  	fill_in 'recipientEmail', with: 'dsv6.automation+user@gmail.com'
  	check 'autoEnabledCheckbox'
    click_on 'Send Invite'
  end
end

Then(/^I should see confirmation that the invitation was sent$/) do
  within_frame('content') do
  	expect(page).to have_content('Processed Records')
  	expect(page).to have_css('td', :text => 'has been sent an initial Invitation')
  end
end
