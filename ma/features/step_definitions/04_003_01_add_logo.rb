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