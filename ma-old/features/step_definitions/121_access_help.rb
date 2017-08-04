
Given(/^I am on my Global Dashboard page$/) do
	expect(page).to have_content('Project Name')
	expect(page).to have_content('DataSite iPad App')
	expect(page).to have_content('What\'s New at DataSite?')
end

When(/^I click the Help link$/) do
	click_on 'Help'
end

Then(/^I should see a new window open displaying the My Dashboard help page$/) do
	within_window(->{ page.title == 'My Dashboard' }) do
		expect(page).to have_content('Welcome')
		expect(page).to have_content('Site Manager Guides')
		expect(page).to have_content('User Guides')
		current_window.close
	end
end


