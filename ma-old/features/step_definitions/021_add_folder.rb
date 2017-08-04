When(/^I click on the fileroom$/) do
    within_frame('content') do
    find('a', :text => fileroomName).click
  end
end

When(/^I click Add Folders$/) do
      within_frame('content') do
    find('a', :text => 'Add Folders').click
  end
end

When(/^I enter text in the Name\(s\) text area$/) do
  within_frame('content') do
  fill_in 'itemNames', with: folderName
  end
end

Then(/^I should see my fileroom summary with newly created folder listed$/) do
    within_frame('content') do 
    expect(page).to have_content 'Security'
    expect(page).to have_content 'Primary Contact:'
    expect(page).to have_content 'Auto-Reindex:'
    expect(page).to have_content 'Access Granted to: Site Manager'
    within('#contentListing') {find('td', :text => folderName)}
    within(find('tr', :text => folderName)) {find('.doMenu')}
  end
end
