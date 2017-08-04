
When(/^I invite a Site Admin type user$/) do
	within_frame('content') do
		select 'Site Admin', from: 'workgroupId'
		select 'Management', from: 'projectGroupId'
		fill_in 'recipientEmail', with: 'dsv6.automation@gmail.com'
		check 'autoEnabledCheckbox'
		#accept popup
		page.driver.browser.switch_to.alert.accept
		click_on 'Send Invite'
	end
end