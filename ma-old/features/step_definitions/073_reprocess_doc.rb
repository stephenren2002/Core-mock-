
When(/^I click on Reprocess Automatically in Color$/) do
  within_frame('content') do
  	find('a', :text => 'Reprocess Automatically in Color').click
  end
end

Then(/^I should see my document with the Reprocess Manually type listed$/) do
	within_frame('content') do
		within('tr.line-hover-highlight') do
			expect(page).to have_content 'Reprocess Auto Color'
		end
	end
end
