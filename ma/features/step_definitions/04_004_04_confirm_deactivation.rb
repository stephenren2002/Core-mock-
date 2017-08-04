#########################################################################################################
# File : 03_004_04_confirm_deactivation.feature                                                         #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
And(/^I Log Out and Login The application as another user$/) do
  if page.title == 'Dashboard'
    sleep 2
  else
    page.driver.browser.switch_to.default_content
    page.driver.browser.switch_to.frame('header')
  end
  find('a', :text => 'Log Off').click
  click_on 'Yes'
  expect(page).to have_content ('Sign Off Successful')
  expect(page).to have_content ('Return to Log In')
  # step "I click Log Off"
  # step "I click Yes to continue"
  # step "I should see the Sign Off Successful page"
  click_on 'Return to Log In'

end

When(/^I enter the username and password as User Group$/) do
  step '"User Group" logged In'
end

Then(/^I should see my Global Dashboard that does not list the project I was deactivated from$/) do
  expect(page).to have_content('Project Name')
  #expect(page).to have_content('What\'s New at DataSite?')
  expect(page).to have_css('#logoffButton')
  within('#projects_wrapper') {
    expect(page).to have_no_content projectName
  }
end
