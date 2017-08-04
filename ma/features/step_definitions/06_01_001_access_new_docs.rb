#########################################################################################################
# File : 05_ug_002_ask_attachment.feature                                                               #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Vinoth,Jagan            Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I click on the New Documents link$/) do
  within('tr.fileroom', :text => $data['fileroom1']) do
    find('a', :text => 'New Documents Added:').click
  end
end

Then(/^I should see a listing of documents added since my last login$/) do
  expect(page).to have_css('span', :text => 'New Documents')
  expect(page).to have_css('.x-grid3-hd-row')
end
