Then(/^I should see my Global Dashboard that again lists the project I was reactivated from$/) do
    expect(page).to have_content('Project Name')
	expect(page).to have_content('What\'s New at DataSite?')
	expect(page).to have_css('#logoffButton')
	within('#projects_wrapper') {
		expect(page).to have_content projectName
	}
end
