
When(/^I click on Preferences$/) do
  click_on 'Preferences'
end

When(/^I click Edit \(preferences\)$/) do
page.within_window windows.last do
    within('.section', :text => 'Preferences') {click_on 'Edit'}
end
end

When(/^I select Weekly for New Documents Uploaded alerts$/) do
  page.within_window windows.last do
  	select 'Weekly', from: 'featureTypeInterval[1]'
  end
end

When(/^I click Save \(preferences\)$/) do
  page.within_window windows.last do
  	click_on 'Save'
  end
end

Then(/^I should see my Preferences summary with New Document alerts set to Weekly$/) do
    page.within_window windows.last do
  	expect(page).to have_content 'New Documents Uploaded: Weekly'
    find('a', :text => 'Close').click
  end
end
