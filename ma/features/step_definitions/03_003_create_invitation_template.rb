#########################################################################################################
# File : 04_004_01_create_invitation_template.feature                                                   #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Siva,Jagan              Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I click on Templates$/) do
  within ('.navTree') {click_on 'Templates'}
end

When(/^I click Add$/) do
  click_on 'Add'
end

When(/^I select Invitation from the Type dropdown$/) do
  select 'Invitation', from: 'templateCreateType' 
end

When(/^I select Russian from the Language dropdown$/) do
  # select 'Russian', from: 'templateLanguage'
  select 'English', from: 'templateLanguage'
end

When(/^I click Next$/) do
  click_on 'Next'
end

When(/^I enter "([^"]*)" in the Label field$/) do |labelText|
  dateTime = Time.new
  $labelTemp1 = labelText + "#{dateTime.strftime("%d-%b-%Y %H:%M")}"
  fill_in 'templateLabel', with: $labelTemp1
end

When(/^I click the Bold button$/) do
  find('#mceu_0').click
end

When(/^I select Tahoma from the Font Family dropdown$/) do
  find('#mceu_8-open').click
  find('#mceu_38').click
end

When(/^I select 14pt from the Font Sizes dropdown$/) do
  find('#mceu_9-open').click
  find('#mceu_49').click
end

When(/^in the Content window I add the text "([^"]*)"$/) do |contentText|
 within_frame('templateContent_ifr') do
find('#tinymce').set(contentText)
end
end

When(/^I center the text$/) do
  find('#mceu_5').click
end

When(/^I click the link "([^"]*)"$/) do |labelText|
within('table.content') do
  find('tr', :text => labelText).click_link labelText
end
end

Then(/^I should see a preview of the invitation I created$/) do
  expect(page).to have_content 'Type: Invitation'
  # expect(page).to have_content 'Label: Cust Rus invitation'
  expect(page).to have_content 'Label: Cust Eng invitation'
  expect(page).to have_content 'This is custom content added to a custom invitation template created via automation.'
end


Then(/^copied invitation should be in template$/) do
  expect(page).to have_content "Copy (1) of #{$labelTemp1}"
end


And(/^read existing content of invitation$/) do
  @legCont1 = find(:xpath,"//div[@id='content']/table/tbody/tr[1]").text
  @legCont2 = find(:xpath,"//div[@id='content']/table/tbody/tr[2]").text
  @legCont3 = find(:xpath,"//div[@id='content']/table/tbody/tr[3]").text
  @legCont4 = find(:xpath,"//div[@id='content']/table/tbody/tr[4]").text
  @legCont5 = @legCont4.gsub("[invitationurl]", "(link updated when sent)").gsub("[endRegistrationDate]", "(date updated when sent)").gsub("[projectname]", projectName)
  @legCont = @legCont1+@legCont3+@legCont5
  puts @legCont
end

And(/^read existing content in preivew of invitation$/) do
  @legPrv1 = find(:xpath,"//div[@id='content']/table/tbody/tr[1]").text
  @legPrv2 = find(:xpath,"//div[@id='content']/table/tbody/tr[2]").text
  @legPrv3 = find(:xpath,"//div[@id='content']/table/tbody/tr[3]").text
  @legPrv = @legPrv1+@legPrv2+@legPrv3
  puts @legPrv
end

Then(/^preview content should match with existing content of invitation$/) do
  #expect(@beforepreview).to eq @preview
  expect(@legCont).to eq @legPrv
end

When(/^Click on link in invitation Template$/) do
  sleep 3
  click_link ($labelTemp1)
end

And(/^click on Delete$/) do
  click_on ' Delete'
  sleep(3)
  page.accept_alert
  sleep(3)
  puts 'Invitation Deleted'
end

Then(/^The invitaion should be deleted$/) do
  select 'Invitation', from: 'templateTypeFilter'
  sleep 2
  page.has_no_text? $labelTemp1
  #expect(page).not_to have_content 'This is a edited text in label'
end

And(/^I click on Save button for copy invitation$/) do
  click_on "Save"
end