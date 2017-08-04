#########################################################################################################
# File : 03_003_02_edit_community.feature                                                               #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
Given(/^I select "([^"]*)" in the right panel$/) do |arg|
  within_frame 'content' do
    first('td', text: $data['community1']).click

  end
end

And(/^I select All Community Members radio button$/) do
  within_frame 'content' do
    find(:xpath, "//td[contains(text(),'All Community Members')]/../td/input").click
  end
end

Then(/^Submit Enabled status should be for All members$/) do
  within_frame 'content' do
    expect(page).to have_content "Label: #{$data['community1']}"
    expect(page).to have_content "Submit Enabled: All Members"
    # Capybara.ignore_hidden_elements = true
  end
end