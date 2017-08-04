@SiteAdmin
Feature: Activity by Date report
  In order to view total doc activity by date
  As a Site Admin
  I want to run the Activity by Date report

  Scenario: Run Activity by Date report
  	Given I am logged into a project
  	When I go to the Reports tab
  	And I run Activity by Date for all dates
  	Then I should see the Activity by Date report display