#########################################################################################################
# File : 03_001_03_enable_qa_admin.feature                                                              #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I enable Q&A Forum access for the Site Admin role$/) do
  within_frame('content') do
    within('.dataSet') {find('tr', :text => 'Site Admin', :match => :prefer_exact).click}
  	find('a', :text => 'Edit Role').click
  	check 'qaTabEnabled'
  	check 'displaySubmittedBy'
  	find('a', :text => 'Save').click
  end
end

Then(/^I should see the Q&A Forum enabled for the role$/) do
  within_frame('content') do
  	expect(page).to have_content 'Role: Site Admin'
  	expect(page).to have_content 'Yes Q&A Forum'
  	expect(page).to have_content 'Yes Display Question Submitted by'
  end
end