#########################################################################################################
# File : 01_001_create_project.feature                                                                  #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################

When(/^I click Printer Friendly Version$/) do
  sleep(5)
  within_frame('content_navbar') do
  	find('.button', :text => 'Printer Friendly Version').click
  end
end

Then(/^I should see the report open in a new window$/) do
  within_window(->{ page.title == 'Activity Timeline' }) do
  	within('#buttonStripId') {
  		expect(page).to have_content 'Print'
  		expect(page).to have_content 'Close'
  	}
  	expect(page).to have_content 'Document Activity by Role'
    expect(page).to have_css 'img'
  	find('.button', :text => 'Close').click
  end
	within_frame 'menu' do
		click_on 'Back'
	end
end
