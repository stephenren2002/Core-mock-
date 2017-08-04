#########################################################################################################
# File : 02_010_submit_session.feature                                                                  #
# Author : Jagan                            Created Date : 30th Nov 2016                                #
# Modified Author : -                       Modified Date : -                                           #
# Info :                                                                                                #
#########################################################################################################

When(/^I click Session Locks in the left pane$/) do
	within_frame('menu') do
		click_on 'Session Locks'
	end
	within_frame('content') do
		expect(page).to have_content('Owner')
		expect(page).to have_content('Auto Approved')
	end
end 

When(/^I click on my Open session$/) do
  within_frame('content') do
  	find('td', :text => 'Open').click
  	expect(page).to have_content('Session Details')
    expect(page).to have_content('Status: Open')
	 expect(page).to have_content('Change')
  end
end

When(/^I click Submit$/) do
  within_frame('content') do
    find('a', :text => 'Submit', :match => :prefer_exact).click
  end
end

Then(/^I should see the Session Details page$/) do
  within_frame('content') do
    expect(page).to have_content('Session Details')
    expect(page).to have_content('Total Changes')
  end
end


