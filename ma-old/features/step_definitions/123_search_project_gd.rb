When(/^I search for "([^"]*)" in the search box$/) do |searchTerm|
find("#projects_filter input", :wait => 7).set(searchTerm)
end

Then(/^the project list should display only projects with "([^"]*)"$/) do |searchTerm|
within('#projects') {
	expect(page).to have_content(searchTerm)
}
end
