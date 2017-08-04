#########################################################################################################
# File : 03_004_06_confirm_reactivation.feature                                                         #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
Then(/^I should see my Global Dashboard that again lists the project I was reactivated from$/) do
    expect(page).to have_content('Project Name')
	#expect(page).to have_content('What\'s New at DataSite?')
	expect(page).to have_css('#logoffButton')
	within('#projects_wrapper') {
		expect(page).to have_content projectName
	}
end
