#########################################################################################################
# File : 03_002_01_add_team.feature                                                                     #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I go to Teams via the left pane$/) do
  within_frame('menu') do
  	click_on 'Teams'
  end
end

When(/^I click Add Team$/) do
  within_frame('content') do
  	click_on 'Add Team'
  end
end


When(/^I enter a team label$/) do
  within_frame('content') do
    fill_in 'label', with: $data['team1']
    # find('a',text: 'Back').click
    click_on 'Save'
    click_on 'Back'
    click_on 'Add Team'
    fill_in 'label', with: $data['team2']
  end
end


Then(/^I should see the new team's detail page$/) do
  within_frame('content') do
    expect(page).to have_content 'Team:' && $data['team2']
    expect(find('tr.header')).to have_content 'Legalese'
  end
end


