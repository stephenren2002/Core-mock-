
When(/^I select a role$/) do
within_frame('content') do
  within('.dataSet') do
  	find('td', :text => roleName).click
  end
end
end

When(/^I select Edit Watermarks$/) do
  within_frame('content') do
  	click_on 'Edit Watermarks'
  end
end

When(/^I add Username as a diagonal watermark$/) do
  within_frame('content') do
  	find('#adderDiag').click
  	find('a', :text => 'Username').click
  end
end

Then(/^I should see the role's summary page with watermark enabled$/) do
  within_frame('content') do
    expect(page).to have_content 'Role:' && roleName
    expect(page).to have_content 'Has Watermark: Yes'
  end
end