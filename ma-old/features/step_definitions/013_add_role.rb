When(/^I go to Roles via the left pane$/) do
  within_frame('menu') do
  	click_on 'Roles'
  end
end

When(/^I click Add Role$/) do
within_frame('content') do
	click_on 'Add Role'
 end
end

When(/^I enter a role label$/) do
  within_frame('content') do
  	fill_in 'label', with: roleName
  end
end

Then(/^I should see the new role's detail page$/) do
  within_frame('content') do
  	expect(page).to have_content 'Role:' && roleName
  	expect(page).to have_content 'Has Watermark: None'
  end
end
