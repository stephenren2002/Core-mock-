Feature: Delete project
	In order to close a project
	As a Merrill User
	I want to delete a project

	Scenario: loging in as Merrill user
		Given "Merrill User" logged In
		And I am on a project's Tracker page

	@Tracker
	Scenario: Delete project
		Given I move to project detail page
		When I click Edit in Primary Information section
		And I close the project
		Then I should see the project's tracker page with closure reports and deleted status

	@Tracker
	Scenario: Clean up content after confirming delete
		Given I am on a project's closed Tracker page
		When I reopen the project
		And I close the project for immediate cleanup
		Then I should see the project's tracker page with removed status

  
