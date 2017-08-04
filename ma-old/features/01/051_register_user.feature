@MerrillUser
Feature: Register User
	In order to provide access to a user 
	As a Merrill User
	I want to register the user

	Scenario: Register User
		Given I am logged into a project
		When I go to the Users tab
		And I go to Users via the left pane
		And I select the user
		And I access the user's invitation email
		And I register the user
		Then I should see the user in an Enabled status 