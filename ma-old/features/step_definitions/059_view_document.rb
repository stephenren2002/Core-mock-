When(/^I go to the Index tab$/) do
  within ('.tabs-btn-top') {click_on 'Index'}
end

When(/^I go to a fileroom$/) do
  within ('.x-tree-node-ct') {find('span', :text => fileroomName).click}
end

When(/^I select a document$/) do
  within('#contentPanel') do
  	within('.x-grid3-body') do
  		find('.x-grid3-cell-inner.x-grid3-col-title', :text => phNameTwo).click
  	end
  end
end

Then(/^I should be able to page through the document$/) do
  within_window(->{ page.title == '1: ' + phNameTwo }) do
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
  end
end
