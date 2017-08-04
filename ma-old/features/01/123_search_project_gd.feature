@MerrillUser
Feature: Search project on GD
  As a Merrill User
  I want to search for project on my dashboard
  So I can easily find a project

  Scenario: Search for a project on the global dashboard
  	Given I am on my Global Dashboard page
  	When I search for "Auto" in the search box
  	Then the project list should display only projects with "Auto" 
