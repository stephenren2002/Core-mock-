#########################################################################################################
# File : 03_003_01_add_community.feature                                                                #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
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

When(/^I enter a Community label$/) do
  within_frame("content") do
    fill_in 'label',:with=> $data['community1']
    click_on 'Save'
    click_on 'Back'
    find('a', :text => 'Add Community').click
    fill_in 'label',:with=> $data['community2']
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
    expect(page).to have_content 'Label: ' + $data['community2']
    expect(page).to have_content 'Question and Answer ID Prefix:'
    expect(page).to have_content 'Submit Enabled: ' + 'All Members'
    click_on 'Back'
  end
  # page.driver.browser.switch_to.frame('header')
end


When(/^I read existing community name$/) do
  within_frame('content') do
    @community_table_row_count = all(:xpath, "//table[@id='dataSet']/tbody/tr").count
    puts @community_table_row_count
    if @community_table_row_count <= 0
      puts "No community in project"
    elsif
    exis_community =find(:xpath, "//table[@id='dataSet']/tbody/tr[1]/td[2]").text
    puts exis_community
    @exiscommunityname = exis_community.to_s
  end
  end
end

And(/^I enter a existing community label$/) do
  within_frame('content') do
    fill_in 'label', with: @exiscommunityname
  end
end


Then(/^I should see error message for duplicate community$/) do
  within_frame('content') do
    if @community_table_row_count <= 0
      puts "No community in project. So no duplicate validation"
    elsif
    errormessage = page.find("[class='error']").text
    actual_dupe_community_error_message = errormessage.to_s
    puts actual_dupe_community_error_message
    expectmessage = "Community having label \"#{@exiscommunityname}\" already exists."
    expected_dupe_community_error_message = expectmessage.to_s
    puts expected_dupe_community_error_message
    expect(actual_dupe_community_error_message).to eq (expected_dupe_community_error_message)
  end
  end
end


Then(/^I should see error message for empty community$/) do
  within_frame('content') do
    emptyerrormessage = page.find("[class='error']").text
    actual_empty_community_error_message = emptyerrormessage.to_s
    puts actual_empty_community_error_message
    emptyexpectmessage = "Label is required."
    expected_empty_community_error_message = emptyexpectmessage.to_s
    puts expected_empty_community_error_message
    expect(actual_empty_community_error_message).to eq (expected_empty_community_error_message)
  end
end