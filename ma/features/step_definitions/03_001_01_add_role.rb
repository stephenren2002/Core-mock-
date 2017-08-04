#########################################################################################################
# File : 03_001_01_add_role.feature                                                                     #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I click Add Role$/) do
  within_frame('content') do
    click_on 'Add Role'
  end
end

And(/^I enter a UG role name for a role$/) do
  within_frame 'content' do
    fill_in 'label',:with=> $data['ugrole1']
    click_on 'Save'
    click_on 'Save'
    find('a',text: 'Back').click
    click_on 'Add Role'
    fill_in 'label',:with=> $data['ugrole2']
  end


end

Then(/^I should see the new role's detail page$/) do
  within_frame('content') do
    expect(page).to have_content 'Role:' && $data['ugrole2']
    expect(page).to have_content 'Has Watermark: None'
  end
end