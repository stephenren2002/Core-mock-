When(/^I click Log Off$/) do
  within_window windows.last do
    find('a', :text => 'Log Off').click
  end
end

When(/^I click Yes to continue$/) do
  within_window windows.last do
  click_on 'Yes'
  end
end

Then(/^I should see the Sign Off Successful page$/) do
  within_window windows.last do
	expect(page).to have_content ('Sign Off Successful')
	expect(page).to have_content ('Return to Log In')
  end
end