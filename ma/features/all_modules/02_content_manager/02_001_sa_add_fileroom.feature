Feature: Create fileroom
	As a user with access to Content Manager
	I want to add a new fileroom
	So I can organize my documents

	Scenario: I am logging in
		Given "Site Admin" is on Home Page
		And I click on "Content Manager" tab

	@SiteAdmin @ContentManager
	Scenario: Add new fileroom
		Given I go to the Content Manager tab
		When I click the Add dropdown
		When I click Add Fileroom button
		When I enter a name in the textbox
		When I click Save (content frame)
		And I should see my new fileroom's details page
		Then the fileroom should be on the left pane navigation tree


