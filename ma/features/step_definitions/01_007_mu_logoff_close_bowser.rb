#########################################################################################################
# File : 01_007_mu_logoff_close_bowser.feature                                                          #
# Author : Jagan                            Created Date : 30th Nov 2016                                #
# Modified Author : -                       Modified Date : -                                           #
# Info :                                                                                                #
#########################################################################################################
Given(/^Merrill User clicks logoff$/) do
  within_window windows.last do
    within_frame 'header' do
      find('a', :text => 'Log Off').click
    end
  end
end

When(/^Merrill User clicks Yes button$/) do
  within_window windows.last do
    within_frame 'header' do
      find(:xpath, "//button[contains(text(),'Yes')]").click
    end
  end
end

Then(/^Merrill User should see the Sign Off Successful page$/) do
  within_window windows.last do

    expect(page).to have_content ('Sign Off Successful')
    expect(page).to have_content ('Return to Log In')
    Local_helper.closebrowser
  end
end