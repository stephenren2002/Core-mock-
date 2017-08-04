
When(/^I click List View$/) do
  within_frame('menu') do
  	find('.button', :text => 'List View').click
  end
end

Then(/^I should see the List view in a newly opened window$/) do
  page.within_window windows.last do
    expect(find('.action-sheet-container')).to have_css ('#changeSessionId')
    expect(find('#datasetHeader')).to have_content 'Index'
    expect(find('#datasetHeader')).to have_content 'Title'
    expect(find('#datasetHeader')).to have_content 'Load Date'
    find('a', :text => 'Close').click
end
end
