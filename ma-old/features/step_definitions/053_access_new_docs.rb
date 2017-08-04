
When(/^I click on the New Documents link$/) do
  find('a', :text => 'New Documents Added:').click
end

Then(/^I should see a listing of documents added since my last login$/) do
  expect(page).to have_css('span', :text => 'New Documents')
  expect(page).to have_css('.x-grid3-hd-row')
end
