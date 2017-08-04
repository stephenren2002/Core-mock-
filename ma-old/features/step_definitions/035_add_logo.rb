
When(/^I attach a logo$/) do
	logoPath = File.expand_path("../../support/logo.png", __FILE__)
	if logoPath.match(/^C:\//)
      logoPath.gsub!(/\//, "\\")
    end
	within ('.navTree') {click_on 'Logos'}
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