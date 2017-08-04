#########################################################################################################
# File : 03_004_01_invite_user.feature                                                                  #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I click Add User$/) do
  within_frame('content') do
    click_on 'Add User'
  end
end

When(/^I invite a User Group type user$/) do
  within_frame('content') do
    select 'User Group', from: 'workgroupId' #just changed rolename into 'User Group'
    #if to handle unloaded fr warning if one is present on project
    select 'Management', from: 'projectGroupId' #Changed teamname into 'Management'
    select $data['community1'], from: 'communityId'
    fill_in 'recipientEmail', with: $cnf['ugusername']
    # fill_in 'recipientEmail', with: 'merrrillusers+102@gmail.com' #For testing
    check 'autoEnabledCheckbox'
    click_on 'Send Invite'
  end
  page.within_window(-> { page.title=='Access Verification' }) do
    within_window windows.last do
      find(:id,'DynaButton_cancel.local').click
    end
      end
end

Then(/^I should see confirmation that the invitation was sent$/) do
  within_frame('content') do
    expect(page).to have_content('Processed Records')
    expect(page).to have_css('td', :text => 'has been sent an initial Invitation')
  end
end


And(/^I invite a new site admin type user$/) do
  within_frame('content') do
    select 'Site Admin', from: 'workgroupId' #just changed rolename into 'User Group'
    #if to handle unloaded fr warning if one is present on project
    select 'Management', from: 'projectGroupId' #Changed teamname into 'Management'
    fill_in 'recipientEmail', with: newuser
    check 'autoEnabledCheckbox'
    select 'English', from: 'languageCode' #Selecting custom invitation
    sleep 2
    find(:xpath, "//*[@id='projectTemplateId']/option[2]").click
    click_on 'Send Invite'
  end
  end


And(/^I select the new user$/) do
  within_frame('content') do
    sleep 2
    within('.dataSet') { find('tr', :text => newuser, exact: true).click }
    sleep 5
  end
end

Then(/^I should see a preview of the invitation I created in Settings$/) do
  within_frame('content')do
  fr= expect(page).to have_content 'This is custom content added to a custom invitation template created via automation.'
  puts fr
  end
  end