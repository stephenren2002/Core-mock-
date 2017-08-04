When(/^I edit the title of a folder$/) do
  within_frame('content') do
    find('a', :text => fileroomName).click
    find('td', :text => folderName).click
    find('a', :text => 'Edit').click
    fill_in 'name', with: editedFolder

  end
end

Then(/^I should see my folder's details page$/) do
  within_frame('content') do
  	expect(page).to have_content 'Title:'
  	expect(page).to have_content 'Locked By:'
    expect(page).to have_css('h2', :text => editedFolder)
  end
end

