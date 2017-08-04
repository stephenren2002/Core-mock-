When(/^I select the admin$/) do
  within_frame('content') do
  within('.dataSet') {find('tr', :text => adminEmail, exact: true).click}
end
end

When(/^I access the admin's invitation email$/) do
within_frame('content') do
	find('a', :text => 'Email History').click
	find('a', :text => 'Invitation to DataSite Project ' + projectName).click
end
end

When(/^I register the admin$/) do
  	within_frame('content') do
		within('table.edit'){
			click_on(first('a')['href'])
		}
	end
	within_window(->{ page.title == 'Merrill DataSite Registration'}) do
	fill_in 'email', with: adminEmail
	click_on 'Save'
	current_window.close
end
end

Then(/^I should see the admin in an Enabled status$/) do
	sleep(3)
  within_frame('menu') do
  	click_on 'Users'
  end
  within_frame('content') do
  	expect(find('.dataSet')).to have_content 'Enabled'
  end
end