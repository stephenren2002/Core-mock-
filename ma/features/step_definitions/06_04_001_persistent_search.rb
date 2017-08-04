#########################################################################################################
# File : 05_ug_002_ask_attachment.feature                                                               #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Vinoth,Jagan            Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################

When(/^I do search in the project's search box$/) do
  fill_in 'searchString', with: $data['searchTerm']
  find("input[name='searchString']").send_keys :enter
  #find("input[name='searchString']").set(name).native.send_keys(:return)
  expect(page).to have_css('#searchForm') 
  expect(page).to have_css('table.dataset')
end

When(/^I open a document that displays in the results$/) do
  find('tr', :text => $data['fileroom1']).click_link $data['placeholder1']

  #find('a', :text => $data['placeholder1']).click
end

Then(/^I should see my search term highlighted in the document$/) do
  within_window(->{ page.title == '5: ' + $data['file1name']}) do
    sleep 5
    # expect(page).to have_css('findbar')
  	expect(page).to have_css('span.h.highlight.selected', :text => /#{$data['searchTerm']}/i)
  	expect(page).to have_css('span.h.highlight', :text => /#{$data['searchTerm']}/i)
    current_window.close
  end
end