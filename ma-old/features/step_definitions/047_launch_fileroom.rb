When(/^I go to Content Manager$/) do
	within_window(->{ page.title == projectName + ' - DataSite' }) do
		within ('.tabs-btn-top') {click_on 'Content Manager'}
  	end
end

When(/^I go to an unlaunched fileroom$/) do
  within_window(->{ page.title == projectName + ' - DataSite' }) do
	within_frame('content') do
		click_on fileroomName
	end
end
end

When(/^I click the Actions dropdown$/) do
  within_window(->{ page.title == projectName + ' - DataSite' }) do
  	within_frame('content')do
  		find('li', :text => 'Actions').click
  	end
  end
end

When(/^I click Launch$/) do
    within_window(->{ page.title == projectName + ' - DataSite' }) do
  	within_frame('content')do
  		find('a', :text => 'Launch').click
  	end
  end
end

Then(/^I should see the fileroom summary page with launch date$/) do
  launchDate = DateTime.now.strftime '%-d-%b-%Y %-H:%M'
  within_window(->{ page.title == projectName + ' - DataSite' }) do
    within_frame('content')do
    expect(page).to have_content ('Fileroom ID:')
    expect(page).to have_content ('Auto-Reindex:')
    expect(page).to have_content ('Launch Date: ' + launchDate)
  end
  end
end
