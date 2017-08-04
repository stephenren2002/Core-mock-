
When(/^I click a document in the View Index$/) do
	click_on 'View Index'
	within_window(->{ page.title == 'Index - ' + projectName }) do
		within(find("tr[doctype='2']", :match => :first)) {find('a').click}
	end
end

Then(/^I should see the document open in the viewer$/) do
	within_window(->{ page.title == '1: ' + phNameTwo }) do
		using_wait_time 5 do
			expect(page).to have_css('#toolbarViewer')
			click_on 'Close this window'
		end
	end
	within_window(->{ page.title == 'Index - ' + projectName }) do
		click_on 'Close'
	end
end