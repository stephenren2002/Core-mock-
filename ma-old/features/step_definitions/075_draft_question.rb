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
  	fill_in 'text', with: draftQuestion
  	fill_in 'priority', with: 'm'
  	find('.x-combo-list-item', :text => 'Medium').click
  	find('#categoryId').click
  	find('.x-combo-list-item', :text => 'General').click
  	click_on 'Save Draft'
  end
end

Then(/^I should see the question appear in Questions Drafting$/) do
	sleep(3)
  find('#status').click
  find('.x-combo-list-item', :text => 'Questions Drafting').click
  click_on 'Search'
  within('.x-grid3-body') {expect(page).to have_content draftQuestion}
end
