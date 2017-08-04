#########################################################################################################
# File : 03_004_02_register_user.feature                                                                #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I select the user$/) do
  within_frame('content') do
    sleep 2
    within('.dataSet') { find('tr', :text => $cnf['ugusername'], exact: true).click }
    sleep 5
  end
end

When(/^I access the user's invitation email$/) do
  within_frame('content') do
    find('a', :text => 'Email History').click
    find('a', :text => 'Invitation to DataSite Project ' + projectName).click
  end
end

When(/^I register the user$/) do
  within_frame('content') do
    within('table.edit') {
      click_on(first('a')['href'])
    }
  end
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    fill_in 'email', with: $cnf['ugusername']
    click_on 'Save'
    current_window.close
  end
end

Then(/^I should see the user in an Enabled status$/) do
  within_frame('menu') do
    click_on 'Users'
  end
  within_frame('content') do
    within('.dataSet') { find('tr', :text => $cnf['ugusername'], exact: true).click }
    expect(page).to have_content 'Enabled'
  end
end
