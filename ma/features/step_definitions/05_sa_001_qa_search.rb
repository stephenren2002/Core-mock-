#########################################################################################################
# File : 05_sa_001_qa_search.feature                                                                    #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Raja,Jagan              Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I search for answers submitted by the Automation Community$/) do
	# expect(page).to have_content('Summary' && 'Assigned to Me' && 'Total Questions Asked Today:')
	find('#status').click
	find('.x-combo-list-item', :text => 'Questions Submitted').click
	find('#communityId').click
	find('.x-combo-list-item', :text => $data['community1']).click
	click_on 'Search'
	end

Then(/^I should see results populate$/) do
  expect(page).to have_content ('Filter Results')
  expect(page).to have_content ($data['questiontext2'])
end