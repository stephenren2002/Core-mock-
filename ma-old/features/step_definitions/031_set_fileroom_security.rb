
When(/^I click Edit \(content frame\)$/) do
  within_frame('content') do
  	find('a', :text => 'Edit').click
  end
end

When(/^I set all roles to Print$/) do
  within_frame('content') do
  	find('span.security-item-all-selector', :text => 'Print').click
  end
end

Then(/^I should see my fileroom summary with View and Print shaded$/) do
  within_frame('content') do 
    expect(page).to have_content 'Primary Contact:'
    expect(page).to have_content 'Auto-Reindex:'
    within('#permissionDiv') {
      expect(page).to have_css('.on.first')
      expect(page).to have_css('.on')
      expect(page).to have_css('.off.last')
    }
  end
end