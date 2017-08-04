When(/^I go to an unlaunched filerooms$/) do
  projectName = Local_helper.projectName
  @fileroomName = Local_helper.fileroomName
  within_window(->{ page.title == projectName + ' - DataSite' }) do
    within_frame('content') do
      click_on @fileroomName
    end
  end
end

When(/^I click the Actions dropdowns$/) do
  within_window(->{ page.title == projectName + ' - DataSite' }) do
    within_frame('content')do
      find('li', :text => 'Actions').click
    end
  end
end

When(/^I click Launchs$/) do
  within_window(->{ page.title == projectName + ' - DataSite' }) do
    within_frame('content')do
	find(:xpath, "//a[contains(text(),'Launch')]").click
      #find('a', :text => 'Launch').click
    end
  end
end

Then(/^I should see the fileroom summary page with launch dates$/) do
  within_frame('content')do
    puts 'i am in content frame'
    @launchDate =  find(:xpath,"//th[text() = 'Launch Date:']/../td").text
    puts @launchDate
  end
  within_window(->{ page.title == projectName + ' - DataSite' }) do
    within_frame('content')do
      expect(page).to have_content ('Fileroom ID:')
      expect(page).to have_content ('Auto-Reindex:')
      expect(page).to have_content ('Launch Date: ' + @launchDate)
    end
  end
end
