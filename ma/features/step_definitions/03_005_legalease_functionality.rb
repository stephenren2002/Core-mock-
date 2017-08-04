And(/^I select Legalese from the Type dropdown$/) do
  select 'Legalese', from: 'templateCreateType'
end

Then(/^I should see alert message$/) do
  sleep 2
  expect(page).to have_content 'Legalese already exists! Cannot create multiple copies'
end

When(/^Click on link "([^"]*)"$/) do |legal|
  sleep 2
  click_link legal
end

And(/^Delete default legalese$/) do
  click_on "Delete"
end

And(/^Accept browser popup$/) do
  #popup = page.driver.browser.window_handles
  #popup = page.drive.switch_to_window
  #within_window (popup) do
  # click_button('OK')
  #alert = driver.switch_to_alert()
  # alert.accep
  page.driver.browser.switch_to.alert.accept

end

Then(/^Legalese should not be in Template$/) do
  sleep 2
  page.has_no_text?'Legalese'
end

And(/^Fill "([^"]*)" in the label name$/) do |labelleg|
  fill_in 'templateLabel', with: labelleg
end


And(/^Fill "([^"]*)" in Subject name$/) do |subject|
  fill_in 'templateSubject', with: subject
end

And(/^Fill Content$/) do
  within_frame('templateContent_ifr') do
    find('#tinymce.mce-content-body').set($data['legalese1'])
    #fill_in '#tinymce', with: $data['legalese1']
  end
end

Then(/^"([^"]*)" should be in the template$/) do |leglabel|
  sleep 2
  expect(page).to have_content leglabel
end

Then(/^"([^"]*)" should be in template$/) do |crlegalese|
  sleep 2
  expect(page).to have_content $labelTemp
end

And(/^I click on legalese Edit button$/) do
  click_on "Edit"
end

And(/^I click on Save$/) do
  click_on "Save"
end

Then(/^Have a text "([^"]*)" in subject$/) do |editsub|
  expect(page).to have_content editsub
end

And(/^I click on Edit button$/) do
  click_on "Edit"
end

And(/^I click on "([^"]*)"$/) do |legbut|
  click_on legbut
end

Then(/^Have a user history$/) do
  expect(page).to have_content 'User Edit'
  expect(page).to have_content 'User Create'
end

And(/^Read existing content$/) do
  @legCont1 = find(:xpath,"//div[@id='content']/table/tbody/tr[1]").text
  @legCont2 = find(:xpath,"//div[@id='content']/table/tbody/tr[2]").text
  @legCont3 = find(:xpath,"//div[@id='content']/table/tbody/tr[3]").text
  @legCont4 = find(:xpath,"//div[@id='content']/table/tbody/tr[4]").text
  @legCont = @legCont1+@legCont3+@legCont4
  puts @legCont
end

And(/^Read existing content in preivew$/) do
  @legPrv1 = find(:xpath,"//div[@id='content']/table/tbody/tr[1]").text
  @legPrv2 = find(:xpath,"//div[@id='content']/table/tbody/tr[2]").text
  @legPrv3 = find(:xpath,"//div[@id='content']/table/tbody/tr[3]").text
  @legPrv = @legPrv1+@legPrv2+@legPrv3
  puts @legPrv
end

Then(/^Preview content should match with existing content$/) do
 #expect(@beforepreview).to eq @preview
 expect(@legCont).to eq @legPrv
end


When(/^Click on link in Email Template$/) do
  sleep 3
  click_link ($labelTemp)
end

And(/^Fill "([^"]*)" in label name$/) do |label|
  dateTime = Time.new
  $labelTemp = label + "#{dateTime.strftime("%d-%b-%Y %H:%M")}"
  fill_in 'templateLabel', with: $labelTemp
end

Then(/^Copied email should be in template$/) do
  expect(page).to have_content "Copy (1) of #{$labelTemp}"
end


Then(/^Email should not be in Template$/) do
  sleep 2
  page.has_no_text? $labelTemp
end