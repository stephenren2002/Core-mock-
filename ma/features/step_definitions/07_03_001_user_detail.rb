#########################################################################################################
# File : 01_001_create_project.feature                                                                  #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################

When(/^I run User Detail report$/) do
  within_frame 'menu' do
		find('a', :text => 'User Detail').click
		find(:field, 'timelineFlag', with: '2').click
		find(:field, 'groupByFlag', with: '2').click
		click_on 'Generate'
	end
end

Then(/^I should see the User Detail report display$/) do
  within_frame 'content' do
  	expect(page).to have_content 'Date Range: From Project Launch To Present'
  	expect(page).to have_css('th', :text => 'Fileroom')
  	expect(page).to have_css('th', :text => 'User - Company')
  	expect(page).to have_css('th', :text => 'Pg')
  	expect(page).to have_css('th', :text => 'Duration')
  end
	within_frame 'menu' do
		click_on 'Back'
	end
end
