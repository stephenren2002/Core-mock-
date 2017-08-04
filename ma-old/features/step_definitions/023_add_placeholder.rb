When(/^I add a placeholder$/) do
  within_frame('content') do
    find('a', :text => fileroomName).click
    find('li', :text => 'Add').click
    find('a', :text => 'Add Placeholders').click
    fill_in 'itemNames', with: phNameOne + "\n" + phNameTwo
  end
end

Then(/^I should see my fileroom summary with newly created placeholder listed$/) do
  within_frame('content') do 
    expect(page).to have_content 'Security'
    expect(page).to have_content 'Primary Contact:'
    expect(page).to have_content 'Auto-Reindex:'
    expect(page).to have_content 'Access Granted to: Site Manager'
    within('#contentListing') {
      find('td', :text => phNameOne)
      find('td', :text => phNameTwo)
    }
    within(find('tr', :text => phNameOne)) {find('.doMenu')}
  end
end

