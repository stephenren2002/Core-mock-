When(/^I enter "(.*)" as "(.*)"$/) do |field,value|
  page.fill_in(field, :with=>value)
end


Then(/^I should see this message "(.*)"$/) do |message|
  expect(page).to have_xpath("//div[@class='errors-container']")
  # expect(page).to have_content(message)
  expect(page.find(:xpath,"//div[@class='ping-error']").text).to eq(message)
end