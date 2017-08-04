When(/^I enter the username and password$/) do
  fill_in 'username', with: userLogin
  fill_in 'password', with: userPW
end

Then(/^I should see my Global Dashboard that does not list the project I was deactivated from$/) do
  expect(page).to have_content('Project Name')
	expect(page).to have_content('What\'s New at DataSite?')
	expect(page).to have_css('#logoffButton')
	within('#projects_wrapper') {
		expect(page).to have_no_content projectName
	}
end
