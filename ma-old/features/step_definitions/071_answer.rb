When(/^I select a Submitted question$/) do
   find('#status').click
	 find('.x-combo-list-item', :text => 'Questions Submitted').click
	 click_on 'Search'
   within('.x-grid3-body') {
    find('tr', :text => 'Submitted', :match => :first).click
  }
end

When(/^I answer the selected question$/) do
  click_on 'Reply'
  fill_in 'text', with: answerText
  click_on 'Submit'
  click_on 'Yes'
end

Then(/^I should see the question move to an Answered status$/) do
  within('.x-tree-node-el.x-tree-node-expanded') {
  	expect(page).to have_content 'Status: Answered'
  	answerDate = DateTime.now.strftime '%-d-%b-%y %H:%M'
  	expect(page).to have_content 'Answered On:' && answerDate
  }
end
