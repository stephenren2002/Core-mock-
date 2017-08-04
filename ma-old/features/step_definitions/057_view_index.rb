
When(/^I click View Index$/) do
  click_on 'View Index'
end

Then(/^I should see the report in a new window$/) do
  within_window(->{ page.title == 'Index - ' + projectName }) do
  	expect(page).to have_content 'File Type'
  	expect(page).to have_content 'Load Date From'
  	expect(find('.header')).to have_css('th', :text=> 'Index')
  	expect(find('.header')).to have_css('th', :text=> 'Pgs')
  	current_window.close
  end
end
