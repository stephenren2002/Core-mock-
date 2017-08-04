#########################################################################################################
# File : 05_ug_002_ask_attachment.feature                                                               #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Vinoth,Jagan            Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I go to the Index tab$/) do
  within ('.tabs-btn-top') {click_on 'Index'}
end

When(/^I click on fileroom1 in the Index left side$/) do
  # within ('.x-tree-node-ct') {find('span', :text => $data['fileroom1']).click}
  # within ('.x-tree-node-ct') {first('span', :text => $data['fileroom1']).click}
  find(:xpath,"//span[contains(text(),'#{$data['fileroom1']}')]").click
end

When(/^I click on first document under Fileroom1 in the Index$/) do
  within('#contentPanel') do
  	within('.x-grid3-body') do
      $file1name = find(:xpath,"//div[contains(text(),'#{$data['placeholder1']}')]").text
      find('.x-grid3-cell-inner.x-grid3-col-title', :text => $data['placeholder1']).click
  	end
  end
end

Then(/^I should be able to page through the document$/) do
  within_window(->{ page.title == '5: ' + $data['file1name']}) do
    puts page.title
  	expect(page).to have_css('#toolbarViewer')
  	expect(page).to have_css('#viewerContainer')
    sleep(2)
  	click_on('Next Page') #2
    sleep(2)
  	click_on('Next Page') #3
    sleep(2)
  	click_on('Next Page') #4
    sleep(2)
  	click_on('Previous Page') #3
    click_on('Close this window')
    current_window.close
  end
end
