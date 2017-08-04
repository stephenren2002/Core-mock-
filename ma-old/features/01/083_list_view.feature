@MerrillUser
Feature: Run List View
  In order to view proposed index after pending sessions are approved
  As a Merrill User
  I want to run a List View

  Scenario: Run List View
	Given I am logged into a project
  	When I go to the Content Manager tab
  	And I click List View
  	Then I should see the List view in a newly opened window

  
