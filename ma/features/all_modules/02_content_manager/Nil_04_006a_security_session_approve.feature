@wip
Feature: Submit and Auto-approve
	In order to publish my changes made for Edit folder title and Add Placeholder to my project in a single step
	As a Site Admin
	I want to Submit and Auto-approve my session

	Scenario: I am logging in
		Given "Site Admin" is on Home Page
		And I click on "Content Manager" tab
		And I go to the Content Manager tab


	Scenario: Submit and Auto-approve
		Given I click Session Locks in the left pane
		And I click on my Open session
		And I click Submit & Auto-Approve
		Then I should return to the Session Locks screen and see no sessions

  
