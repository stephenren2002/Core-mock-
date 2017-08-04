#########################################################################################################
# File : 01_001_create_project.feature                                                                  #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################

When(/^I run Q&A Forum Activity for all dates$/) do
  within_frame('menu') do
  	find('a', :text => 'Q&A Forum Activity').click
  	find(:field, 'timelineFlag', with: '2').click
  	click_on 'Generate'
  end
end

Then(/^I should see the Q&A Forum Activity report display$/) do
  within_frame('content') do
    sleep 2
  	within("tr[bgcolor='silver']"){
  	expect(page).to have_content 'Action' && 'Category' && 'Question/Answer' && 'User'
  }
  end
  within_frame 'menu' do
    click_on 'Back'
  end
end
