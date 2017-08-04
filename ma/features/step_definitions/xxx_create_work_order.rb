
When(/^I complete and submit the form for a media work order$/) do
	click_on 'bAddWorkorder'
	select 'CD/DVD/HDD', from: 'workOrderTypeId'
	using_wait_time 25 do
		fill_in 'requestedByPersonName', :with => 'automationz'
		page.find(:css, '#ui-id-1 .ui-menu-item', match: :first).click
		sleep(5)
	end
	find('#aPopupCalendaer2').click
	#popup calendar
	within_window(->{ page.title == 'Select Date, Please.' }) do
		click_on 'OK'
	end
	select 'Flash', from: 'cdMediaType'
	fill_in 'contentSize', :with => '4'
	check 'cdIncludeSrc'
	fill_in 'cdNonAuthSetQty', :with => '2'
	fill_in 'csNotes', :with => 'Automated note'
	click_on 'Submit'
end

When(/^I select the Requested Items$/) do
	#this popup shouldn't happen! (and doesn't when manually doing this)
  #page.driver.browser.switch_to.alert.accept
  find('#bEditCdExtract').click
  check 'selectedCdRoots'
  click_on 'Save'
end

When(/^I Release to Prod$/) do
  find('#bReleaseToProd').click
end

Then(/^I should see the work order details page with status as pending$/) do
  expect(page).to have_content 'Media Type:' && 'Flash'
  expect(page).to have_content 'Status:' && 'Pending'
end
