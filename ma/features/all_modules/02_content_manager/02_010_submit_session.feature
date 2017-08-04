Feature: Submit a session
	In order to process my changes to my project
	As a Merrill User
	I want to submit my open session

	Scenario: Scenario: I am logging in the application and launching inside Hope page
		Given "Site Admin" is on Home Page
		And I click on "Content Manager" tab
		And I go to the Content Manager tab

	@SiteAdmin
	Scenario: Submit session
		Given I click Session Locks in the left pane
		And I click on my Open session
		And I click Submit
		Then I should see the Session Details page

  
