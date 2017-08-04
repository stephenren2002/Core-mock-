#########################################################################################################
# File : 03_001_04_add_watermark.feature                                                                #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
And(/^I select default "([^"]*)" role$/) do |role|
  within_frame('content') do
    @rolename = role
    within('.dataSet') do
      case
        when @rolename == 'Site Admin'
          find('td', :text => $data['sadefrole']).click
        when @rolename == 'User Group'
          find('td', :text => $data['ugdefrole']).click
      end
    end
  end
end

When(/^I select Edit Watermarks$/) do
  within_frame('content') do
    click_on 'Edit Watermarks'
  end
end

When(/^I add Username as a diagonal watermark$/) do
  within_frame('content') do
    find('#adderDiag').click
    find('a', :text => 'Username').click
  end
end

Then(/^I should see the role's summary page with watermark enabled$/) do
  within_frame('content') do
    expect(page).to have_content 'Role:' && @rolename
    expect(page).to have_content 'Has Watermark: Yes'
  end
end