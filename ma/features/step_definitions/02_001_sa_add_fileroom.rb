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

Then(/^The fileroom should be on the left pane navigation tree$/) do
  within_frame('menu') do
    expect(page).to have_content $data['fileroom5']
  end
  within_frame('content') do
    click_on 'Up'
  end
end


When(/^I choose add fileroom by right click from left pane$/) do
  within_frame('menu') do
    find('#webfx-tree-object-3-anchor').right_click
    sleep 2
    within("div[class='contextMenu']"){
    find("[id='contextMenuItem']", :text => 'Add Fileroom').click}
  end
end

When(/^I enter a fileroom6 in the title box$/) do
  within_frame('content') do
    fill_in 'description', with: $data['fileroom6']
  end
end

Then(/^I should see the fileroom6 in left pane navigation tree$/) do
  within_frame('menu') do
    expect(page).to have_content $data['fileroom6']
    end
  within_frame('content') do
    click_on 'Up'
  end
  end



When(/^I select edit from right click of fileroom6 from left pane$/) do
  within_frame('menu') do
    find(:xpath, "//a[text()='#{$data['fileroom6']}']").right_click
    sleep 2
    within("div[class='contextMenu']"){
      find("[id='contextMenuItem']", :text => 'Edit').click}
  end
end

And(/^I enter edited name for fileroom$/) do
  within_frame('content') do
    sleep 2
    find(:xpath,"//input[@name='name']").set($data['editedFileroom6'])
  end
end

Then(/^I should see the editedfileroom6 in left pane navigation tree$/) do
  within_frame('menu') do
    expect(page).to have_content $data['editedFileroom6']
  end
end

When(/^I select edit from right click of fileroom6 from right pane$/) do
  within_frame('content') do
    find(:xpath, "//a[text()='#{$data['editedFileroom6']}']").right_click
    sleep 2
     find("[id='action-edit']", :text => 'Edit', :match => :prefer_exact).click
  end
end

And(/^I enter right pane right click edited name for fileroom$/) do
  within_frame('content') do
    sleep 2
    find(:xpath,"//input[@name='name']").set($data['editedFileroom6.1'])
  end
end

Then(/^I should see the editedfileroom6 right click right pane edited in left pane navigation tree$/) do
  within_frame('menu') do
    expect(page).to have_content $data['editedFileroom6.1']
  end
end

When(/^I select edit for fileroom6 from action from right pane$/) do
  within_frame('content') do
    find(:xpath, "//a[text()='#{$data['editedFileroom6.1']}']/../../td[7]").click
    sleep 2
    find("[id='action-edit']", :text => 'Edit', :match => :prefer_exact).click
  end
end

And(/^I enter right pane action edited name for fileroom$/) do
  within_frame('content') do
    sleep 2
    find(:xpath,"//input[@name='name']").set($data['editedFileroom6.2'])
  end
end


Then(/^I should see the editedfileroom6 through action edited name in left pane navigation tree$/) do
  within_frame('menu') do
    expect(page).to have_content $data['editedFileroom6.2']
  end
end

When(/^I select edit for fileroom6 from greenbar from right pane$/) do
  within_frame('content') do
    find(:xpath, "//a[text()='#{$data['editedFileroom6.2']}']").click
    sleep 2
    find('a', :text => 'Edit').click
  end
end

And(/^I enter right pane green bar edited name for fileroom$/) do
  within_frame('content') do
    sleep 2
    find(:xpath,"//input[@name='name']").set($data['editedFileroom6.3'])
  end
end

Then(/^I should see the editedfileroom6 through green bar edited name in left pane navigation tree$/) do
  within_frame('menu') do
    expect(page).to have_content $data['editedFileroom6.3']
  end
end
