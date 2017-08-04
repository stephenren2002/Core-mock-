When(/^I do search in the project's search box$/) do
  fill_in 'searchString', with: searchTerm
  find("input[name='searchString']").send_keys :enter
  expect(page).to have_css('#searchForm') 
  expect(page).to have_css('table.dataset')
end

When(/^I open a document that displays in the results$/) do
  find('a', :text => phNameTwo).click
end

Then(/^I should see my search term highlighted in the document$/) do
  within_window(->{ page.title == '1: ' + phNameTwo }) do
  	expect(page).to have_css('#findbar')
  	expect(page).to have_css('span.h.highlight.selected', :text => /#{searchTerm}/i)
  	expect(page).to have_css('span.h.highlight', :text => /#{searchTerm}/i)
    click_on 'Close this window'
  end
end
