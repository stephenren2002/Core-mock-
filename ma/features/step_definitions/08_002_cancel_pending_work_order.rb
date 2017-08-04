When(/^I cancel a workorder that's in a pending status$/) do
  within('#workorderViews') do
  	within(find('tr', :text => 'Pending')) do
  		find('#aWorkorderView').click
  	end
  end
  sleep 3
  click_on 'Cancel Work Order'
end

Then(/^I should see the workorder move to a cancelled status$/) do
  within('#workorderViews') do
  	expect(page).to have_content 'Cancelled'
  end
end

Given(/^I move to project detail page$/) do
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