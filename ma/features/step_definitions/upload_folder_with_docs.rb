When(/^I click Add Documents$/) do
	within_frame('content') do
		within('.popup-exclusive') {
		find('li', :text => 'Add Documents').click
	}
	end
end

When(/^I complete the Add Documents wizard$/) do
	within_window(->{ page.title == 'Add Document - DataSite ' + projectName}) do
		#java applet??
		find('#dsFileApplet').click



		find(:field, 'dataGridBox', with: 'upload.folder_file_19').click
		click_on 'Add'
		click_on 'Next'
	end
	within_window(->{ page.title == 'Rename Document - Content Manager'}) do
		click_on 'Next'
	end
	within_window(->{ page.title == 'Set Document Security - Content Manager'}) do
		find('.security-item-all-selector', :text => 'Download').click
		click_on 'Next'
	end
	within_window(->{ page.title == 'Confirm Changes - Content Manager'}) do
		click_on 'Finish'
	end
end

Then(/^I should see an open session with docs in it$/) do
  within_frame('menu') do
  	find('a', :text => 'Session Locks').click
  end
  within_frame('content') do
  	find("tr[data-state='open']").click
  	find('.command-group-all').click
  	expect(page).to have_content 'New EDoc'
  	expect(page).to have_content 'Set View/Print/Download'
  end
end