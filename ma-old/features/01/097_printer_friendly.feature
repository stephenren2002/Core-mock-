@SiteAdmin
Feature: Printer Friendly Activity Timeline
  In order to get printer friendly report graphics
  As a Site Admin
  I want to access the printer friendly report versions

  Scenario: Printer Friendly Activity Timeline
  	Given I am logged into a project
	When I go to the Reports tab
	And I run Activity Timeline for all dates, all roles
	And I click Printer Friendly Version
  	Then I should see the report open in a new window

  
