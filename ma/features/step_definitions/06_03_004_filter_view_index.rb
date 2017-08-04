#########################################################################################################
# File : 05_ug_002_ask_attachment.feature                                                               #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Vinoth,Jagan            Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I filter for documents in the View Index$/) do
	within_window(->{ page.title == 'Index - ' + projectName }) do
		select 'Documents', from: 'typeChoice'
		click_on 'View'
	end
end

Then(/^I should see the filtered report$/) do
	within_window(->{ page.title == 'Index - ' + projectName }) do
		within('#dataRows .body-width table.dataset') do
			expect(page).to have_css("tr[doctype='2']")
			expect(page).to have_css('td', :text => $data['fileroom1'])
			expect(page).to have_css('.doMenu')
		end
		click_on 'Close'
		# current_window.close
	end
end