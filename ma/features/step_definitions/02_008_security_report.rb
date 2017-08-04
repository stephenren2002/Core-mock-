#########################################################################################################
# File : 02_007_security_report.feature                                                                 #
# Author : Jagan                            Created Date : 30th Nov 2016                                #
# Modified Author : -                       Modified Date : -                                           #
# Info :                                                                                                #
#########################################################################################################

When(/^I click Reports$/) do
  within_frame('content') do
  	find('li', :text => 'Reports').click 
  end
end

When(/^I click Security Report$/) do
  within_frame('content') do
  	find('a', :text => 'Security Report').click 
  end
end

Then(/^I should see the Security Report popup window$/) do
  within_window(->{ page.title == 'Security Report - ' + projectName}) do
  	expect(page).to have_content 'Show Expanded'
	expect(page).to have_content 'Select specific roles'
	expect(page).to have_css ('table.dataset')
  current_window.close
  end
end