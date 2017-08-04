When(/^I click on my Needs Approval session$/) do
  within_frame('content') do
  	find('td', :text => 'Needs Approval').click
  	expect(page).to have_content('Session Details')
  	expect(page).to have_content('Status: Needs Approval')
    expect(page).to have_content('Change')
  end
end

When(/^I click Approve$/) do
  within_frame('content') do
  	click_on 'Approve'
  end
end

Then(/^I should see the Session Locks page and my session is not listed$/) do
  within_frame('content') do
  	expect(page).to have_content('Status')
  	expect(page).to have_content('Owner')
  	expect(page).to have_content('Fileroom')
  	expect(page).to have_content('Results')
  	expect(page).to have_css('table#dataset')
  end
end
