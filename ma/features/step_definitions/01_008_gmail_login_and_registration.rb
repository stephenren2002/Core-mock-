#########################################################################################################
# File : 01_008_gmail_login_and_registration.feature                                                    #
# Author : Jagan                            Created Date : 30th Nov 2016                                #
# Modified Author : -                       Modified Date : -                                           #
# Info :                                                                                                #
#########################################################################################################
Given(/^I visit Gmail$/) do
  visit 'https://accounts.google.com/ServiceLogin?service=mail&continue=https://mail.google.com/mail/#identifier'
end

When(/^I enter the user Credentials$/) do
  if page.has_button? 'next'
    fill_in 'Email', :with => $cnf['gmailusername']
    click_on 'next'
  end
  if page.has_button? 'signIn'
    fill_in 'Passwd', :with => $cnf['gmailpassword']
    end
end

And(/^I click on submit button$/) do
  click_on 'signIn'
end

And(/^I click on the project invitation$/) do
  within 'div.Cp'do
    invitationname = "Invitation to DataSite Project #{projectName}"
    page.find(:xpath, "//b[contains(text(),'#{invitationname}')]").click
    end
end

And(/^I click on the project invitation link$/) do
  within 'div.gs' do
    env = $cnf['environment']
      case
        when env == 'stage'
          find(:xpath,"//a[contains(text(),'stage-maw')]").click
        when env == 'stage2'
          find(:xpath,"//a[contains(text(),'stage2-maw')]").click
        when env == 'testb'
          find(:xpath,"//a[contains(text(),'testb')]").click
        when env == 'prod'
          find(:xpath,"//a[contains(text(),'registration')]").click
    end
  end
end

And(/^I enter the username and submit$/) do
  within_window windows.last do

    fill_in 'email', :with=> 'dsv6.automation@gmail.com'
    click_on 'Save'
    end
end

Then(/^I should get registration confirmation message$/) do
  within_window windows.last do
    expect(page).to have_content 'Thank you for registering with Merrill DataSite'
    Local_helper.closebrowser
  end
end