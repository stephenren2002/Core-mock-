When(/^I conduct a search$/) do
  within_window(->{ page.title == '1: ' + phNameTwo }) do
  	click_on 'Find in Document'
  	fill_in 'findInput', with: searchTerm
  end
end
