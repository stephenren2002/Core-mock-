And(/^I select email alerts from the Type dropdown$/) do
  #page.select_list(:id, "emailAlert").select_value("Detailed Alerts")
    #select 'Detailed Alerts', from: 'emailAlert'
    select 'Disable', from: 'emailAlert'
  sleep 2

    #page.find(:xpath,"//select[@id = 'emailAlert']").click
    #option = find(:xpath,"//*[@value = 'Detailed Alerts']")
    #option.click
    #select(option, :from => "emailAlert")

end

And(/^I select other option in the email branding Language dropdown$/) do
    page.find(:xpath,"//input[@id = 'emailFromOption2']").click
  sleep 2

end

And(/^I type the content for the branding$/) do
    #page.find(:xpath,"//select[@id = 'emailFromBrand']").Sendkeys ("vanitha")
  fill_in 'emailFromBrand', with: 'Test'
  sleep 2


end

And(/^I change the disclaimer frequency from the dropdown$/) do
    select 'Once', from: 'legaleseClick'
  sleep 2

end

And(/^I change the timezone of the project$/) do
    #select 'America/Los_Angeles BHL (Bunker Hill) America/Los_Angeles (Pacific Standard Time) 3:17 AM, Thu', from: 'timeZone'
    select (timeZoneSelect), from: 'timeZone'

end

Then(/^I should see a changes made in the settings tab$/) do ||
  #expect(page).to have_content ('Time Zone: ' && timeZoneDisplay)
  expect((find(:xpath,"//*[@id='content']/table//th[text()='Email Alerts:']/../td").text).include? 'Disabled').to eq true
  #expect((find(:xpath,"//*[@id='content']/table//th[text()='Email Alerts - Show Details:']/../td").text).include? 'Custom: vanitha').to eq 'true'
  expect((find(:xpath,"//*[@id='content']/table//th[text()='Email Branding:']/../td").text).include? 'Custom: Test').to eq true
  expect((find(:xpath,"//*[@id='content']/table//th[text()='Legalese Click:']/../td").text).include? 'Once').to eq true
  expect((find(:xpath,"//*[@id='content']/table//th[text()='Project Time Zone:']/../td").text).include? 'America/Chicago').to eq true

end