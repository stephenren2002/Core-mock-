When(/^I select the user$/) do
  within_frame('content') do
  within('.dataSet') {find('tr', :text => userEmail, exact: true).click}
end
end

When(/^I access the user's invitation email$/) do
  within_frame('content') do
	find('a', :text => 'Email History').click
	find('a', :text => 'Invitation to DataSite Project ' + projectName).click
end
end

When(/^I register the user$/) do
  within_frame('content') do
		within('table.edit'){
			click_on(first('a')['href'])
		}
	end
	within_window(->{ page.title == 'Merrill DataSite Registration'}) do
	fill_in 'email', with: userEmail
	click_on 'Save'
	current_window.close
end
end

Then(/^I should see the user in an Enabled status$/) do
  within_frame('menu') do
  	click_on 'Users'
  end
  within_frame('content') do
  	within('.dataSet') {find('tr', :text => userEmail, exact: true).click}
  	expect(page).to have_content 'Enabled'
  end
end
