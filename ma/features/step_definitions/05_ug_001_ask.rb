#########################################################################################################
# File : 05_ug_001_ask.feature                                                                          #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Raja,Jagan              Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I go to the Q&A Forum tab$/) do
  within ('.tabs-btn-top') {click_on 'Q&A Forum'}
  sleep 3
end

When(/^I ask a question$/) do
	#get projectID
	def url
    URI.parse(current_url).request_uri
  end
  urlArray = url.split("=")
  projectID = urlArray.at(1) 

  click_on 'Ask Question'
  within_window(->{ page.current_url == baseAskQuestionUrl + projectID + '&objectType=' }) do
  	expect(page).to have_content 'No files selected for upload.'
  	fill_in 'text', with: $data['questiontext1']
    fill_in 'priority', with: 'h'
    find('.x-combo-list-item', :text => 'High').click
    find('#categoryId').click
    find('.x-combo-list-item', :text => 'General').click
    click_on 'Submit'
    expect(page).to have_content 'Once a question is submitted, it cannot be deleted.'
    click_on 'Yes'
    sleep 3
    # step 'I ask a question'
    end
end

Then(/^I should see the question appear in Questions Submitted$/) do
  find('#status').click
  find('.x-combo-list-item', :text => 'Questions Submitted').click
  click_on 'Search'
  within('.x-grid3-body')  {expect(page).to have_content $data['questiontext1']}
end

