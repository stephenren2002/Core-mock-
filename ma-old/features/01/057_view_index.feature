@User
Feature: Run View Index
  In order to view a list of all content I have access to
  As a User
  I want to run a View Index report

  Scenario: Run View Index
  	Given I am logged into a project
  	When I go to the Index tab
  	And I click View Index
  	Then I should see the report in a new window

  
