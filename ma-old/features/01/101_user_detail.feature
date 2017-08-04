@SiteAdmin
Feature: User Detail report
  In order to see users' specific document activity
  As a Site Admin
  I want to run the User Detail report

  Scenario: Run User Detail report
  	Given I am logged into a project
  	When I go to the Reports tab
  	And I run User Detail report
  	Then I should see the User Detail report display

  
