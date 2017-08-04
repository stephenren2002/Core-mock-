#########################################################################################################
# File : 02_001_sa_add_fileroom.feature                                                                 #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I go to the Content Manager tab$/) do
  within ('.tabs-btn-top') {click_on 'Content Manager'}
end

When(/^I click the Add dropdown$/) do
  within_frame('content') do
  sleep 3
    find('li', :text => 'Add').click
  end
end

When(/^I click Add Fileroom button$/) do
  within_frame('content') do
  sleep 3
    find('a', :text => 'Add Fileroom').click
  end
end

When(/^I enter a name in the textbox$/) do 
  within_frame('content') do
    fill_in 'description', with: $data['fileroom5']
  end
end

When(/^I click Save \(content frame\)$/) do
    within_frame('content') do
    click_on 'Save'
  end
end

And(/^I should see my new fileroom's details page$/) do
  within_frame('content') do 
    expect(page).to have_content 'Security'
    expect(page).to have_content 'Primary Contact:'
    expect(page).to have_content 'Auto-Reindex:'
    expect(page).to have_content 'Access Granted to: Site Manager'
  end
end

Then(/^the fileroom should be on the left pane navigation tree$/) do
  within_frame('menu') do
    expect(page).to have_content $data['fileroom5']
  end
  within_frame('content') do
    click_on 'Up'
  end
end
