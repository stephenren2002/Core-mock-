
When(/^I close the project$/) do
  select 'Close', from: 'selectProjectState'
  click_on 'Submit'
end

Then(/^I should see the project's tracker page with closure reports and deleted status$/) do
  until page.has_content?('OK - 10 reports(s) created') #reports are found
  	using_wait_time 10 do
  		find('#breadCrumbLink0').click
  	end
  end
end

Given(/^I am on a project's closed Tracker page$/) do
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
    expect(page).to have_content 'Project Closure State: Done'
    expect(page).to have_content 'PROJECT CLOSE REPORTS'
end

When(/^I reopen the project$/) do
  #get projectId
def url
  URI.parse(current_url).request_uri
end
urlArray = url.split("=")
projectID = urlArray.at(1)

#visit primary info edit to reopen project
 projEditPrimaryInfoUrl = baseEditPrimaryInfoUrl + projectID
visit projEditPrimaryInfoUrl
select 'Open', from: 'selectProjectState'
click_on 'Submit'
end

When(/^I close the project for immediate cleanup$/) do
  click_on 'Delete'
  # using_wait_time 10 do
  #   find('#breadCrumbLink0').click
  # end
end

Then(/^I should see the project's tracker page with removed status$/) do
sleep(3)
  find('#breadCrumbLink0').click
  expect(page).to have_content 'Deleted - Removed Date:'
end	