#########################################################################################################
# File : 03_004_08_view_user_details.feature                                                            #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I select the user with email address of "([^"]*)"$/) do |saEmail|
  within_frame('content') do
  	within('table#dataSet')	{find('td', :text => saEmail, exact: true).click}
  end
end

Then(/^I should see the details page of user with email address "([^"]*)"$/) do |userEmail|
	within_frame('content') do
		expect(page).to have_content 'E-mail:' && userEmail
		expect(page).to have_content 'Role:'
		expect(page).to have_content 'Challenge:'
	end
end