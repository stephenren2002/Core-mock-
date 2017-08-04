
When(/^I answer the question with a See Also$/) do
  click_on 'Reply'
  fill_in 'text', with: 'Please see this document.'
  click_on 'Add See Also'

  #get projectID
	def url
    URI.parse(current_url).request_uri
  end
  urlArray = url.split("=")
  projectID = urlArray.at(1)

  within_window(->{ page.current_url == baseSeeAlsoUrl + projectID }) do
  	find('.x-tree-ec-icon.x-tree-elbow-end-plus').click
  	first('.x-tree-node-cb').click 
  	click_on 'Save'
  end
  click_on 'Submit'
  click_on 'Yes'
end

Then(/^I should see the document linked in the answer$/) do
  within('.x-tree-node-el.x-tree-node-expanded') {
  	expect(page).to have_content 'Status: Answered'
  	answerDate = DateTime.now.strftime '%-d-%b-%y %H:%M'
  	expect(page).to have_content 'Answered On:' && answerDate
  }
    within ('.x-tree-node-el.x-tree-node-leaf') {
  	expect(page).to have_css('#seeAlsoSection')
  }
end