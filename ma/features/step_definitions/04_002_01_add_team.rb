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


When(/^I read existing team name$/) do
  within_frame('content') do
   existingTeam =find(:xpath, "//table[@id='dataSet']/tbody/tr[1]/td[2]").text
    puts existingTeam
   @existingTeamName = existingTeam.to_s
  end
end

And(/^I enter a existing team label$/) do
    within_frame('content') do
      fill_in 'label', with: @existingTeamName
  end
end

Then(/^I should see error message for duplicate team$/) do
  within_frame('content') do
    actual_dupe_team_error_message = page.find("[class='error']").text.to_s
    expected_dupe_team_error_message = "Team by name '#{@existingTeamName}' already exists.".to_s
    expect(actual_dupe_team_error_message).to eq (expected_dupe_team_error_message)
  end
end

Then(/^I should see error message for empty team$/) do
  within_frame('content') do
    actual_empty_team_error_message = page.find("[class='error']").text.to_s
    expected_empty_team_error_message = "Team Name required.".to_s
    expect(actual_empty_team_error_message).to eq (expected_empty_team_error_message)
  end
end