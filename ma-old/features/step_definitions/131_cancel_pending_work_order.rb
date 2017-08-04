When(/^I cancel a workorder that's in a pending status$/) do
  within('#workorderViews') do
  	within(find('tr', :text => 'Pending')) do
  		find('#aWorkorderView').click
  	end
  end
  click_on 'Cancel Work Order'
end

Then(/^I should see the workorder move to a cancelled status$/) do
  within('#workorderViews') do
  	expect(page).to have_content 'Cancelled'
  end
end