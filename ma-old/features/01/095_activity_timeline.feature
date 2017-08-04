@SiteAdmin
Feature: Run Activity Timeline report
  In order to see document activity over time
  As a Site Admin
  I want to view the Activity Timeline report

  Scenario: Activity Timeline report
  	Given I am logged into a project
	When I go to the Reports tab
	And I run Activity Timeline for all dates, all roles
	Then I should see the Activity Timeline report display

  
