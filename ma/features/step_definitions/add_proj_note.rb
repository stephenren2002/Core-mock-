When(/^I click Add Note and see the new popup$/) do
	#page title with Tracker No
	def pageTitle
		page.title
	end

	#get projectID
	def url
  URI.parse(current_url).request_uri
end
urlArray = url.split("=")
projectID = urlArray.at(1)


	click_on 'bAddNote'

	within_window(->{ page.current_url == 'https://ds6-testb-tracker.adminsys.mrll.com/datasite/note/note_add_prompt.do?projectId=' + projectID}) do
		expect(page).to have_content 'Changed By'
		expect(page).to have_content 'Reason'
		expect(page).to have_content 'Activate Java'
	#try to activate java
	#didn't succeed BLOCKED
end
end

When(/^I check the critical checkbox$/) do
	# within_window noteWindow do
	# 	check 'critical'
	# end
end

When(/^I enter "([^"]*)" as the Subject$/) do |subjectText|
  #fill_in 'subject', :with => subjectText
end

When(/^I check the Project Management category$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I select "([^"]*)" in the Font family dropdown$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I select "([^"]*)" in the Font size dropdown$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click the italics button$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I add the text "([^"]*)" to the text box$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the new note on the Tracker page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
