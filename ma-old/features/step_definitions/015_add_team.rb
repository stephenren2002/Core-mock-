
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
    fill_in 'label', with: teamName
  end
end

Then(/^I should see the new team's detail page$/) do
  within_frame('content') do
    expect(page).to have_content 'Team:' && teamName
    expect(find('tr.header')).to have_content 'Legalese'
  end
end
