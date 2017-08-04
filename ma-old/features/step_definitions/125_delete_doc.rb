
When(/^I click on a document$/) do
	within_frame('content') do
		find("tr[objtype='document']", :match => :first).click
  #find('abbr', :text => '4').click
end
end

When(/^I click on Actions$/) do
  within_frame('content') do
  	find('li', :text => 'Actions').click
  end
end

When(/^I click on Delete$/) do
	within_frame('content') do
		find('a', :text => 'Delete').click
  	    #Accept confirmation popup
  	    page.driver.browser.switch_to.alert.accept
  	end
  end

Then(/^I should see the document marked for deletion in the fileroom summary$/) do
	within_frame('content') do
		within('tr', :text => phNameTwo) do
			expect(page).to have_css("abbr[title='Locked for delete']")
		end
	end
end