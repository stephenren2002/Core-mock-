
Given(/^I am on a project's Tracker page$/) do 
within('table.dashboard-table', :match => :prefer_exact) do
  find('tr', :text => dataCenter).click_link 'DataSite Tracker'
end
  within('table.headerframe') {fill_in 'projectName', :with => projectName}
  find('table.headerframe input').send_keys :enter
  #if a non-deleted project exists
  if page.has_css?("img[src='/datasite/images/cabinet.png']")
    within(find('tr', :text => projectName, :match => :prefer_exact)) {
    find('#aProjectViewProjectNumber').click
  }  
end
    expect(page).to have_content ('Project Name: ' && projectName)
    expect(page).to have_content 'SECURITY OPTIONS'
    expect(page).to have_content 'WORK ORDERS'
    expect(page).to have_content 'CONTACTS'
  end

When(/^I click Edit in Primary Information section$/) do
  click_on 'bEditPrimaryInfo'
end

When(/^I select "([^"]*)" in the End Client Region dropdown$/) do |clientRegion|
  select (clientRegion), from: 'endClientRegion'
end

When(/^I select "([^"]*)" in the Time Zone dropdown$/) do |timeZoneSelect|
  select (timeZoneSelect), from: 'timeZone'
end

When(/^I add "([^"]*)" as the SA Number$/) do |saNumber|
  fill_in 'salesNumber', :with => saNumber
end

Then(/^I should return to the project's Tracker page$/) do
  expect(page).to have_content ('Project Name: ' && projectName)
  expect(page).to have_content 'SECURITY OPTIONS'
  expect(page).to have_content 'WORK ORDERS'
  expect(page).to have_content 'CONTACTS'
end

Then(/^I should see the End Client region updated to "([^"]*)"$/) do |clientRegion|
  expect(page).to have_content ('End Client Region: ' && clientRegion)
end

Then(/^I should see the Time Zone display as "([^"]*)"$/) do |timeZoneDisplay|
  expect(page).to have_content ('Time Zone: ' && timeZoneDisplay)
end

Then(/^I should see the SA Number updated to "([^"]*)"$/) do |saNumber|
  expect(page).to have_content ('SA Number: ' && saNumber)
end
