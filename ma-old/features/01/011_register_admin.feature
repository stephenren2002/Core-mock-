@MerrillUser
Feature: Register Admin
	In order to provide access to an admin 
	As a Merrill User
	I want to register the user

	Scenario: Register Admin
		Given I am logged into a project
		When I go to the Users tab
		And I go to Users via the left pane
		And I select the admin
		And I access the admin's invitation email
		And I register the admin
		Then I should see the admin in an Enabled status 