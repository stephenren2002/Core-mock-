#########################################################################################################
# File : 02_006_set_fileroom_security.feature                                                           #
# Author : Jagan                            Created Date : 30th Nov 2016                                #
# Modified Author : -                       Modified Date : -                                           #
# Info :                                                                                                #
#########################################################################################################

Given(/^I click on first Fileroom in Left Panel$/) do
  within_frame('menu') do
     click_on $data['fileroom1']
  end
end

When(/^I click Edit \(content frame\)$/) do
    within_frame('content') do
    sleep 2
      find(:xpath, "//a[contains(text(),'Edit')]").click
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