@MerrillUser
Feature: Edit project details
  In order change info about a project
  As a Merrill user
  I want to edit the Project Details section in Tracker

  Scenario: Edit project details
  	Given I am on a project's Tracker page
  	When I click Edit in the Project Details section
  	And I select "Site admin only" in the Live Chat dropdown
  	And I set the Page Threshold to "10000"
  	And I click the Submit (tracker)
  	Then I should return to the project's Tracker page
  	And I should see Live Chat updated to "Site admin only"
  	And I should see the Page Threshold updated to "10000"

  
