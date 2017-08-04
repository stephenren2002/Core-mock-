
When(/^I run Q&A Forum Activity for all dates$/) do
  within_frame('menu') do
  	find('a', :text => 'Q&A Forum Activity').click
  	find(:field, 'timelineFlag', with: '2').click
  	click_on 'Generate'
  end
end

Then(/^I should see the Q&A Forum Activity report display$/) do
  within_frame('content') do
  	within("tr[bgcolor='silver']"){
  	expect(page).to have_content 'Action' && 'Category' && 'Question/Answer' && 'User'
  }
  end
end
