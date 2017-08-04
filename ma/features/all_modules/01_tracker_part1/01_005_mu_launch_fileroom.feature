
Feature: Launch fileroom
	In order to make client's project contents visible to reviewers
	As a Merrill User
	I want to launch a fileroom

	Scenario: I am logging in
		Given "Merrill User" is on Home Page
		And I click on "Content Manager" tab
		And Merrill User go to Content Manager

	@MerrillUser @smoketest
	Scenario: Launch fileroom
		Given Merrill User select Multiple Launch
		And Merrill User click Launch
		Then Merrill User should see the fileroom summary page with launch date