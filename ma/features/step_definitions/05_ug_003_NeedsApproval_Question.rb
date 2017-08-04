And(/^I submit a question for approval$/) do
  def url
    URI.parse(current_url).request_uri
  end
  urlArray = url.split("=")
  projectID = urlArray.at(1)

  click_on 'Ask Question'
  within_window(->{ page.current_url == baseAskQuestionUrl + projectID + '&objectType=' }) do
    expect(page).to have_content 'No files selected for upload.'
    fill_in 'text', with: $data['NeedsApproval1']
    fill_in 'priority', with: 'm'
    find('.x-combo-list-item', :text => 'Medium').click
    find('#categoryId').click
    find('.x-combo-list-item', :text => 'General').click
    click_on 'Submit For Approval'
    sleep 2
  end
end


Then(/^I should see the question appear in Questions Needs Approval$/) do
  sleep(3)
  find('#status').click
  find('.x-combo-list-item', :text => 'Questions Need Approval').click
  click_on 'Search'
  within('.x-grid3-body') {expect(page).to have_content $data['NeedsApproval1']}
  sleep 2
  step 'I submit a question for approval'
  sleep 2
  step 'I submit a question for approval'
  sleep 2
  click_on 'Search'
 within('.x-grid3-body') {expect(page).to have_content $data['NeedsApproval1']}
end