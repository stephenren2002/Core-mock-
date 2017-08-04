#########################################################################################################
# File : 01_004_mu_launch_fileroom.feature                                                              #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^Merrill User go to Content Manager$/) do
within_window windows.last do
    # within_window(->{ page.title == projectName + ' - DataSite' }) do
      within ('.tabs-btn-top') {click_on 'Content Manager'}
    end
  end
# end


And(/^Merrill User select Multiple Launch$/) do
  within_window windows.last do
    within_frame 'content' do
      find(:xpath,"//th[@class='check-all']").click
    end
  end
end


When(/^Merrill User click Launch$/) do
  within_window windows.last do
    # within_window(->{ page.title == projectName + ' - DataSite' }) do
      within_frame('content')do
	  find(:xpath, "//a[contains(text(),'Launch')]").click
      #find('a', :text => 'Launch').click
      sleep 2
    end
  end
end

Then(/^Merrill User should see the fileroom summary page with launch date$/) do
  within_window windows.last do
  # within_window(->{ page.title == projectName + ' - DataSite' }) do
    within_frame('content')do
      sleep 2
      launchsummary =  find(:xpath,"//*[@id='assetBatchResults']").text
      expect(page).to have_content ('FileRoom1 launched.')
      expect(page).to have_content ('FileRoom2 launched.')
      expect(page).to have_content ('FileRoom3 launched.')
      expect(page).to have_content ('FileRoom4 launched.')
      expect(page).to have_content (launchsummary)
      click_on 'Ok'
      page.driver.browser.switch_to.default_content
      page.driver.browser.switch_to.frame('header')
    end
  end
end


