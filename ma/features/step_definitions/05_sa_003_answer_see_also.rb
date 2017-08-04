#########################################################################################################
# File : 05_sa_003_answer_see_also.feature                                                              #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Raja,Jagan              Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I answer the question with a See Also$/) do
  click_on 'Reply'
  fill_in 'text', with: $data['answertext3']
  click_on 'Add See Also'

  #get projectID
	def url
    URI.parse(current_url).request_uri
  end
  urlArray = url.split("=")
  projectID = urlArray.at(1)

  within_window(->{ page.current_url == baseSeeAlsoUrl + projectID }) do
  	# first('.x-tree-ec-icon.x-tree-elbow-end-plus').click
    find(:xpath,"//span[contains(text(),'#{$data['fileroom1']}')]").double_click
    sleep 2
  	first('.x-tree-node-cb').click
  	click_on 'Save'
  end
  click_on 'Submit'
  click_on 'Yes'
end

Then(/^I should see the document linked in the answer$/) do
  within('.x-tree-node-el.x-tree-node-expanded') {
  	expect(page).to have_content 'Status: Answered'
    answerDate =   page.find(:xpath,"(//*[contains(text(),'Answered On:')]//..)[1]").text
    expect(page).to have_content answerDate
  }
    within ('.x-tree-node-el.x-tree-node-leaf') {
  	expect(page).to have_css('#seeAlsoSection')
  }
end