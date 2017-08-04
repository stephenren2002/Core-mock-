When(/^I click Log Off$/) do
  find('a', :text => 'Log Off').click
end

When(/^I click Yes to continue$/) do
  click_on 'Yes'
end

Then(/^I should see the Sign Off Successful page$/) do
	expect(page).to have_content ('Sign Off Successful')
	expect(page).to have_content ('Return to Log In')
end
