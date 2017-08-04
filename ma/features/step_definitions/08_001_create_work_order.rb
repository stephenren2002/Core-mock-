Given(/^I am on a project's Tracker page1$/) do

    within('table.dashboard-table', :match => :prefer_exact) do
      find('tr', :text => $cnf['datacenter']).click_link 'DataSite Tracker'
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

When(/^I search for project$/) do
  within('table.headerframe') {fill_in 'projectName', :with => projectName}
  find('table.headerframe input').send_keys :enter
  find('projectName').native.send_keys(:return)
end

When(/^I complete and submit the form for a media work order1$/) do
  click_on 'bAddWorkorder'
  # select 'CD/DVD/HDD', from: 'workOrderTypeId'
  select 'Doc/Index', from: 'workOrderTypeId'
  using_wait_time 25 do
    select $data['fileroom1'],:from=> 'assetId'
    fill_in 'requestedByPersonName', :with => 'automationz'
    page.find(:css, '#ui-id-1 .ui-menu-item', match: :first).click
    sleep(5)
  end
  find(:xpath,"//table[@class='formTable']/tbody/tr[8]/td/a").click
  # page.click_link_or_button 'a#aPopupCalendaer2'
  # page.click_link_or_button 'iCalendarWizard2'
  #popup calendar
  within_window(->{ page.title == 'Select Date, Please.' }) do
    click_on 'OK'
  end
  # select 'Flash', from: 'cdMediaType'
  # fill_in 'contentSize', :with => '4'
  # check 'cdIncludeSrc'
  # fill_in 'cdNonAuthSetQty', :with => '2'
  fill_in 'csNotes', :with => 'Automated CS note'
  click_on 'Submit'
end

When(/^I select the Requested Items1$/) do
  #this popup shouldn't happen! (and doesn't when manually doing this)
  #page.driver.browser.switch_to.alert.accept
  # find('#bEditWorkorder').click_button
  # click_on '#bEditWorkorder'
  # click_on 'workorderEditButton'
  page.find(:xpath,"//*[@class='title']/td/button[1]").click
  fill_in 'csNotes', :with => 'Automated Prod note'
  click_button 'bCheckRequiredFieldsAndSubmit'
end

When(/^I Release to Prod1$/) do
  find('#bReleaseToProd').click
end

Then(/^I should see the work order details page with status as pending1$/) do
  expect(page).to have_content 'Work Order Type:' && 'Doc/Index'
  expect(page).to have_content 'Status:' && 'Pending'
end


