And(/^I select Email from the Type dropdown$/) do
  select 'Email', from: 'templateCreateType'
end

And(/^Delete created email template$/) do
  click_on "Delete"
end




And(/^I click on Copy option$/) do
  click_on "Copy"
end

And(/^I click on Save button for copy email$/) do
  click_on "Save"
end


And(/^I edit the content in template$/) do
  within_frame('templateContent_ifr') do
    find('#tinymce.mce-content-body').set($data['legalese2'])
  end
end

Then(/^Content should have edited text$/) do
  @legCont4 = find(:xpath,"//div[@id='content']/table/tbody/tr[4]/td").text
  expect(@legCont4).to eq ($data['legalese2'])
  #expect(page).to have_content "#{$data['legalese2']}"
end
