@SiteAdmin
Feature: Back to Dashboard
  In order to access my other projects
  As a Site Admin
  I want to return to my Global Dashboard from inside a project

Scenario: Back to Dashboard
	Given I am logged into a project
	When I click the Dashboard link
	Then I should see my Global Dashboard