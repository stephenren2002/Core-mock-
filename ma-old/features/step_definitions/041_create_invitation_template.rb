
When(/^I click on Templates$/) do
  within ('.navTree') {click_on 'Templates'}
end

When(/^I click Add$/) do
  click_on 'Add'
end

When(/^I select Invitation from the Type dropdown$/) do
  select 'Invitation', from: 'templateCreateType' 
end

When(/^I select German from the Language dropdown$/) do
  select 'German', from: 'templateLanguage'
end

When(/^I click Next$/) do
  click_on 'Next'
end

When(/^I enter "([^"]*)" in the Label field$/) do |labelText|
  fill_in 'templateLabel', with: labelText
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
  expect(page).to have_content 'Label: Custom German invitation'
  expect(page).to have_content 'This is custom content added to a custom invitation template created via automation.'
end
