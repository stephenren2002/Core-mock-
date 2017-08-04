#########################################################################################################
# File : 05_sa_002_qa.feature                                                                           #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Raja,Jagan              Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I select a Submitted question$/) do
find('#status').click
find('.x-combo-list-item', :text => 'Questions Submitted').click
click_on 'Search'
within('.x-grid3-body') {
  find('tr', :text => 'Submitted', :match => :first).click
}
end

When(/^I answer the selected question$/) do
  #answerText = Local_helper.answerText
  click_on 'Reply'
  fill_in 'text', with: $data['answertext1']
  click_on 'Submit'
  click_on 'Yes'
end

Then(/^I should see the question move to an Answered status$/) do
  within('.x-tree-node-el.x-tree-node-expanded') {
    expect(page).to have_content 'Status: Answered'
    answerDate =   page.find(:xpath,"(//*[contains(text(),'Answered On:')]//..)[1]").text
    puts answerDate
    expect(page).to have_content answerDate
  }
end
