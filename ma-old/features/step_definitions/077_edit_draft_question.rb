When(/^I select a Drafting question$/) do
  find('#status').click
	 find('.x-combo-list-item', :text => 'Questions Drafting').click
	 click_on 'Search'
   within('.x-grid3-body') {
    find('tr', :text => 'Drafting', :match => :first).click
  }
end

When(/^I edit and submit the question$/) do
  click_on 'Edit'
  fill_in 'text', with: editDraftQuestion
  click_on 'Submit'
  expect(page).to have_content 'Once a question is submitted, it cannot be deleted.'
  click_on 'Yes'
end

Then(/^I should see the question move to Submitted status$/) do
  within('.x-grid3-body') {
  	within('.x-grid3-row.x-grid3-row-first.x-grid3-row-selected') {
  		expect(page).to have_css('div', :text => 'Submitted')
  		expect(page).to have_css('div', :text => editDraftQuestion)
  	}
  }
end
