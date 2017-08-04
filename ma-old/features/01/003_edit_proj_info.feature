@MerrillUser
Feature: Edit project Primary Information
  As a Tracker user
  I want to edit a project's Primary Information
  So I can make needed changes to project's info

  Scenario: Edit project Primary Information
  	Given I am on a project's Tracker page
  	When I click Edit in Primary Information section
  	And I select "Central" in the End Client Region dropdown
  	And I select "CHI (Chicago)" in the Time Zone dropdown
  	And I add "12345" as the SA Number
  	And I click Submit (tracker)
  	Then I should return to the project's Tracker page
  	And I should see the End Client region updated to "Central"
  	And I should see the Time Zone display as "America/Chicago"
  	And I should see the SA Number updated to "12345"

  
