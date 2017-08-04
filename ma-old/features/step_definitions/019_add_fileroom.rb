Given(/^I am logged into a project$/) do
click_on projectName
using_wait_time 2 do
if page.has_content?('DataSite Terms of Use')
  click_on 'I Accept'
end
if page.has_content?('Disclaimer') 
  click_on 'I Accept'
end
end
expect(page).to have_content 'Fileroom'
expect(page).to have_content 'Status'
expect(page).to have_content 'Preferences'
within ('#ext-gen35') {expect(page).to have_content projectName}
end

When(/^I go to the Content Manager tab$/) do
  within ('.tabs-btn-top') {click_on 'Content Manager'}
end

When(/^I click the Add dropdown$/) do
  within_frame('content') do
    find('li', :text => 'Add').click
  end
end

When(/^I click Add Fileroom button$/) do
  within_frame('content') do
    find('a', :text => 'Add Fileroom').click
  end
end

When(/^I enter a name in the textbox$/) do 
  within_frame('content') do
    fill_in 'description', with: fileroomName
  end
end

When(/^I click Save \(content frame\)$/) do
    within_frame('content') do
    click_on 'Save'
  end
end

Then(/^I should see my new fileroom's details page$/) do
  within_frame('content') do 
    expect(page).to have_content 'Security'
    expect(page).to have_content 'Primary Contact:'
    expect(page).to have_content 'Auto-Reindex:'
    expect(page).to have_content 'Access Granted to: Site Manager'
  end
end

Then(/^the fileroom should be on the left pane navigation tree$/) do
  within_frame('menu') do
    expect(page).to have_content fileroomName
  end
end
