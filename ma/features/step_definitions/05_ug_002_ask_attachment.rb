#########################################################################################################
# File : 05_ug_002_ask_attachment.feature                                                               #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Raja,Jagan              Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I ask a question with an attachment$/) do
  #get projectID
  def url
  	URI.parse(current_url).request_uri
  end
  urlArray = url.split("=")
  projectID = urlArray.at(1)

  click_on 'Ask Question'
  within_window(->{ page.current_url == baseAskQuestionUrl + projectID + '&objectType=' }) do
  	expect(page).to have_content 'No files selected for upload.'
  	fill_in 'text', with: $data['questiontext2']
  	fill_in 'priority', with: 'h'
  	find('.x-combo-list-item', :text => 'High').click
  	find('#categoryId').click
  	find('.x-combo-list-item', :text => 'General').click
    attachmentPath = File.join(doclocation,'test_pdf.pdf')
    attach_file('attachments', attachmentPath, visible: false)
    click_on 'Submit'
    expect(page).to have_content 'Once a question is submitted, it cannot be deleted.'
    click_on 'Yes'
    sleep 4
  end
end

Then(/^I should see the question with attachment appear in Questions Submitted$/) do
	sleep 4
  find('#status').click
  find('.x-combo-list-item', :text => 'Questions Submitted').click
  click_on 'Search'
  within('.x-grid3-body') {
    expect(page).to have_content $data['questiontext2']
    expect(page).to have_css("img[src='/bidder/images/forum/paperclip.png']")
    sleep 2
    #step 'I click on "Q&A Forum" tab'
  }
end
