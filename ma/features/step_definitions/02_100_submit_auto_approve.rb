#########################################################################################################
# File : 02_100_submit_auto_approve.feature                                                             #
# Author : Jagan                            Created Date : 30th Nov 2016                                #
# Modified Author : -                       Modified Date : -                                           #
# Info :                                                                                                #
#########################################################################################################

When(/^I click Submit & Auto\-Approve$/) do
	within_frame('content') do
  find('a', :text => 'Submit & Auto-Approve').click
  end
end

Then(/^I should return to the Session Locks screen and see no sessions$/) do
  within_frame('content') do
  	expect(page).to have_css('li', :text => 'Reports')
    i=1
    until i>=10
      resultvalue = find(:xpath,"//span[@id='recordCount']" ).text
      # puts resultvalue #To Debug
      if  resultvalue == '0'
        expect(page).to have_content 'Results: 0'
        break
      end
      click_on 'Refresh'
      sleep 3
    end

  end
end

And(/^I Auto Approve the Open session created above$/) do
  step 'I click Session Locks in the left pane'
  step 'I click on my Open session'
  step 'I click Submit & Auto-Approve'
  step 'I should return to the Session Locks screen and see no sessions'
  step 'I jump to Content Manager from Session Locks Tab'
end


And(/^I jump to Content Manager from Session Locks Tab$/) do
  page.driver.browser.switch_to.default_content
  page.driver.browser.switch_to.frame('header')
  step 'I click on "Content Manager" tab'
  step 'I go to the Content Manager tab'
end

# And(/^I jump to "([^"]*)" from "([^"]*)" Tab$/) do |tabclick, arg2|
#   @tabclick =tabclick
#   step "I click on #{@tabclick} tab"
#   step "I click on #{tabclick} tab"
#
# end