#########################################################################################################
# File : 03_004_07_edit_user.feature                                                                    #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I select the User Group user$/) do
within_frame('content') do
  within('.dataSet') {find('tr', :text => $cnf['ugusername'], exact: true).click}
end
end

When(/^I select role "([^"]*)"$/) do |newRole|
	within_frame ('content') do
		select newRole, from: 'workgroupId'
	end
  	#get currentRole
  	#if currentRole = User Group, select Automation Role
  	#else select User Group
end

Then(/^I should see the User details page reflecting the "([^"]*)" role change$/) do |newRole|
  within_frame ('content') do
  	expect(page).to have_content 'Role:' && newRole
  end
end