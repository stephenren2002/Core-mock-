Given(/^I am on the tracker login page$/) do
  visit '/login?_alfRedirect=%2Fds%2Fr%2Ftracker'
end

When(/^when i enter username "([^"]*)" and password "([^"]*)"$/) do |username, password|
  fill_in 'loginUsername', :with => username
  fill_in 'loginPassword', :with => password
  click_on 'Login'
end

Then(/^list of projects should return and i can open project with project number  "([^"]*)"$/) do |arg1|
  page.should have_content 'Recent Projects'
  click_on 'launch_project_P16-000-0201'
end

Given(/^on Dashboard i should see advanced button and search box$/) do
  visit '/project/6d5c99ff-8782-49ba-a67e-5e8b790e1cf4'
  page.should have_content 'Advanced'
  find('#ext-comp-1335')
end

Then(/^search for "([^"]*)"$/) do |searchTerm|
  find('.search-trigger-main input').set(searchTerm)
  find('.search-trigger-main img').click
end

Then(/^click on action menu and add folder$/) do
    find("#contentManager .tabs-contain .x-tab-strip li", :text => 'Content').click
end

Then(/^i should be able to click on action menu$/) do
  find("#contentManager .x-toolbar .x-btn-text", :text => 'New').click
end


Then(/^i should be able to click on add folder$/) do
  click_on 'new-fileroom-button'
end

Then(/^i should be able to put fileroom title$/) do
  fill_in 'fileroomTitle', :with => 'TestFileroom'
  find_by_id('fileRoomSaveButton').find('.x-btn-text').click
end

Then(/^I should be able to refresh tree$/) do
  first("#cmManageFolderListTree .x-tree-node-anchor", :text => 'TestAutomation', :wait => 10).click
end

Then(/^click on TestFileroom row$/) do
  find(".x-grid3-row-last").click
end


Then(/^click on action menu$/) do
  find("#contentManager .x-toolbar .x-btn-text", :text => 'Actions').click
end

Then(/^deactivate fileroom$/) do
  click_on 'deactivateFileroom'
   find('.x-btn-text', :text => 'Yes').click
end

Then(/^refresh tree again$/) do
  first("#cmManageFolderList .x-tree-node-anchor", :text => 'TestAutomation').click
end


Then(/^select deactivated fileroom again$/) do
  find(".x-grid3-row-last").click
end

Then(/^click to delete$/) do
  find("#contentManager .x-toolbar .x-btn-text", :text => 'Actions').click
end

Then(/^click on TestFileroom delete it$/) do
    click_on 'deleteFileroom'
end

Then(/^click on action to delete fileroom$/) do
    find('.x-btn-text',:text => 'Yes').click
end

Then(/^refresh tree even again$/) do
  first("#cmManageFolderList .x-tree-node-anchor", :text => 'TestAutomation').click
end

Then(/^saved seach third time$/) do
    page.should have_content 'Saved'
end

Then(/^folder list third time$/) do
  page.should have_content 'Folder List'
end
