#########################################################################################################
# File : 01_005_mu_invite_site_admin.feature                                                            #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
Given(/^Merrill User go to Users Tab$/) do
      within_window windows.last do
        within_frame 'header' do
        within ('.tabs-btn-top') {click_on 'Users'}
        end
    end
  end


And(/^Merrill User go to Users via the left pane$/) do
within_window windows.last do
  within_frame('menu') do
    click_on 'Users'
  end
end
end

And(/^Merrill User click Add User$/) do
  within_window windows.last do
      within_frame('content') do
      click_on 'Add User'
    end
  end
end


And(/^Merrill User invite a Site Admin type user$/) do
  within_window windows.last do
  within_frame('content') do
    select 'Site Admin', from: 'workgroupId'
    select 'Management', from: 'projectGroupId'
    fill_in 'recipientEmail', with: 'dsv6.automation@gmail.com'
    check 'autoEnabledCheckbox'
    #accept popup
    page.driver.browser.switch_to.alert.accept
    click_on 'Send Invite'
  end
  end
end



Then(/^Merrill User should see confirmation that the invitation was sent$/) do
  within_window windows.last do
  within_frame('content') do
    expect(page).to have_content('Processed Records')
    expect(page).to have_css('td', :text => 'has been sent an initial Invitation')
    sleep 3
    page.driver.browser.switch_to.default_content
    page.driver.browser.switch_to.frame('header')
  end
end
end

