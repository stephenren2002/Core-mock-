#########################################################################################################
# File : 04_003_01_add_logo.feature                                                                     #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Siva,Jagan              Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I attach a logo$/) do
=begin old code
	logoPath = File.expand_path("../../src/logo.png", __FILE__)

      expand_path("../../src/logo.png", __FILE__)
	if logoPath.match(/^C:\//)
      logoPath.gsub!(/\//, "\\")
  end
=end
  logoPath = File.join(doclocation, 'logo.png')
  logoPath = logoPath.gsub('/','\\')
  attach_file("file", logoPath)
  click_on 'Upload'
  within('#logosRequest') {
    expect(page).to have_css('.client-logo')
  }
  click_on 'Apply'
end

Then(/^I should see my uploaded file in the upper right corner of my project$/) do
  within('#header') {
    expect(page).to have_css('#customLogoImg')
  }
end

And(/^I click on remove in logo$/) do
  #if page.has_css? within('#header', :prefer_exact=>'#customLogoImg') do
    within('#logosRequest') {
    expect(page).to have_css('.client-logo')
  }
  click_on 'Remove'
end

Then(/^I should see custom logo removed in the upper right corner of my project$/) do
  within('#header'){
  # expect(page).has_no_css?('#customLogoImg')
    sleep 3
  expect(page).not_to have_selector '#customLogoImg'
  }
end

And(/^I click on Delete in logo$/) do
  within('#logosRequest') {
    expect(page).to have_css('.client-logo')
  }
  click_on 'Delete'
end

And(/^I click on Delete confirmation in popup$/) do
  #if page.has_content?('Delete Image?')
   # click_on 'Delete'
    #end
  #page.accept_alert
  #page.driver.browser.switch_to.alert
  #page.driver.browser.switch_to.window('Delete Image?')
  #click_on 'Delete'
  find(:xpath, "/html/body/div[6]/div[3]/div/button[1]").click
end

Then(/^I should not see any client logo under logosRequest$/) do
  within('#logosRequest') {
    page.has_no_css? ('.client-logo')
  }
end