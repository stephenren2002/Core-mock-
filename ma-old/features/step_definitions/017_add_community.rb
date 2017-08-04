
When(/^I go to the Users tab$/) do
  within ('.tabs-btn-top') {click_on 'Users'}
end

When(/^I go to Communities via the left pane$/) do
  within_frame('menu') do
  	click_on 'Communities'
  end
end

When(/^I click Add Community$/) do
  within_frame('content') do
  	click_on 'Add Community'
  end
end

When(/^I enter a community label$/) do
  within_frame('content') do
    fill_in 'label', with: communityName
  end
end

When(/^I edit the community to be submit enabled$/) do
  within_frame('content') do
      find('a', :text => 'Edit Community').click
      find(:field, 'submitterMode', with: 'all').click
      find('a', :text => 'Save').click
  end
end

Then(/^I should see the new community's detail page$/) do
  within_frame('content') do
    expect(page).to have_content 'Label: ' + communityName
    expect(page).to have_content 'Question and Answer ID Prefix:'
    expect(page).to have_content 'Submit Enabled: ' + 'All Members'
  end
end
