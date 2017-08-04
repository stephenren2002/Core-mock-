#########################################################################################################
# File : 03_002_02_edit_teamname.feature                                                                #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
And(/^I click on "([^"]*)" tabs$/) do |tab|
  @tabclick =tab
  page.click_link(@tabclick)

end


And(/^Select "([^"]*)" from the left pane$/) do |list|

  within_frame("menu") do
    click_link list
  end
end

And(/^click any team from the right pane$/) do
 within_frame("content") do
   # find('td',text: $data['team2']).click
   find(:xpath, "//td[text() = '#{$data['team2']}']").click
 end
end
And(/^Click "([^"]*)" button in the green bar$/) do |edit_button|
  within_frame("content") do
    click_link edit_button
    end
end
=begin

And(/^Edit (.*) names$/) do|teamname|
  within_frame("content") do
        fill_in 'label',:with=> teamname
  end
end
=end

And(/^click  save$/) do
  within_frame("content") do
    click_link_or_button "Save"
  end
end

Then(/^Edit team name should get saved with (.*)$/) do |teamname|
  within_frame("content") do
    expect(page).to have_content "Team" && teamname

  end

end


