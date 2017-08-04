
When(/^I filter for documents$/) do
	within_window(->{ page.title == 'Index - ' + projectName }) do
		select 'Documents', from: 'typeChoice'
		click_on 'View'
	end
end

Then(/^I should see the filtered report$/) do
	within_window(->{ page.title == 'Index - ' + projectName }) do
		within('#dataRows .body-width table.dataset') do
			expect(page).to have_css("tr[doctype='2']")
			expect(page).to have_css('td', :text => fileroomName)
			expect(page).to have_css('.doMenu')
		end
		click_on 'Close'
	end
end