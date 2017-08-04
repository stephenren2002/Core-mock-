
When(/^I click the Dashboard link$/) do
  within('#header') {click_on 'Dashboard'}
    expect(page).to have_content('Project Name')
	expect(page).to have_content('DataSite iPad App')
	expect(page).to have_content('What\'s New at DataSite?')
end

