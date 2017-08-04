@SiteAdmin
Feature: Run Q&A Forum Activity report
In order to review all Q&A Forum activity
As a Site Admin
I want to run the Q&A Forum Activity report

Scenario: Run Q&A Forum Activity report
	Given I am logged into a project
	When I go to the Reports tab
	And I run Q&A Forum Activity for all dates
	Then I should see the Q&A Forum Activity report display

  
