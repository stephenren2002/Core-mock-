When(/^I click on the fileroom1 in right panel$/) do
    within_frame('content') do
      sleep 2
    find('a', :text => $data['fileroom1']).click
  end
end

When(/^I click Add Folders$/) do
      within_frame('content') do
        #sleep 3
	  find('a', :text => 'Add Folder').click
	  #find(:xpath, "//a[contains(text(),'Add Folders')]").click
  end
end

When(/^I enter text in the Name\(s\) text area$/) do
# sleep 3
  within_frame('content') do
    sleep 3
    i=1
    for i in 1..5
      foldername =  "Folder#{i}\n"
       if i <= 5
        find(:xpath,"//textarea[@id='itemNames']").send_keys foldername
       end
      i+=1
    end
  end
 end

Then(/^I should see my fileroom summary with newly created folder listed$/) do
    within_frame('content') do 
    expect(page).to have_content 'Security'
    expect(page).to have_content 'Primary Contact:'
    expect(page).to have_content 'Auto-Reindex:'
    expect(page).to have_content 'Access Granted to: User Group'
    within('#contentListing') {find('tr', :text => $data['folder5'])}
    within(find('tr', :text => $data['folder5'])) {find('.action-icon')}
    page.driver.browser.switch_to.default_content
    page.driver.browser.switch_to.frame 'header'
  end
end


Given(/^I click on Fileroom1 in Left Panel$/) do
  within_frame('menu') do
    click_on $data['fileroom1']
  end
end

When(/^I edit the title of a folder$/) do
  within_frame('content') do
    find('td', :text => $data['folder5']).click
    find('a', :text => 'Edit').click
    fill_in 'name', with: $data['editedflder5']

  end
end

Then(/^I should see my folder's details page$/) do
  within_frame('content') do
    expect(page).to have_content 'Title:'
    expect(page).to have_content 'Locked By:'
    expect(page).to have_css('h2', :text => $data['editedflder5'])
  end
end


