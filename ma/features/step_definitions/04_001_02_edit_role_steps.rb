#########################################################################################################
# File : 03_001_02_edit_role.feature                                                                    #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
And(/^I select "([^"]*)" from drop down$/) do |role_filter|
  within_frame("content") do
    select(role_filter, :from => "profileType")
  end

end

And(/^click Role from the right pane$/) do
  within_frame("content") do
    find(:xpath, "//td[text() = '#{$data['ugrole2']}']").click
  end
end


And(/^Enter (.*) name$/) do |role_label|
  within_frame("content") do
    fill_in 'label', :with => role_label
  end

end


Then(/^Edited (.*) should get saved$/) do |name|
  within_frame("content") do
    expect(page).to have_content "Role" && name
  end
  # page.driver.browser.switch_to.frame('header')
end

