#########################################################################################################
# File : 05_ug_003_draft_question.feature                                                               #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Raja,Jagan              Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I save a question as a draft$/) do
  #get projectID
  def url
  	URI.parse(current_url).request_uri
  end
  urlArray = url.split("=")
  projectID = urlArray.at(1)

  click_on 'Ask Question'
  within_window(->{ page.current_url == baseAskQuestionUrl + projectID + '&objectType=' }) do
  	expect(page).to have_content 'No files selected for upload.'
  	fill_in 'text', with: $data['draftquestion1']
  	fill_in 'priority', with: 'm'
  	find('.x-combo-list-item', :text => 'Medium').click
  	find('#categoryId').click
  	find('.x-combo-list-item', :text => 'General').click
  	click_on 'Save Draft'
    sleep 3
    end
end

Then(/^I should see the question appear in Questions Drafting$/) do
	sleep(3)
  find('#status').click
  find('.x-combo-list-item', :text => 'Questions Drafting').click
  click_on 'Search'
  within('.x-grid3-body') {expect(page).to have_content $data['draftquestion1']}
  sleep 2
  step 'I save a question as a draft'
  sleep 2
  step 'I save a question as a draft'
  sleep 2
  step 'I save a question as a draft'
  sleep 2
  click_on 'Search'
  sleep 2
  within('.x-grid3-body') {expect(page).to have_content $data['draftquestion1']}
end
