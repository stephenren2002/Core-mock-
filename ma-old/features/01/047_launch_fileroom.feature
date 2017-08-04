@MerrillUser
Feature: Launch fileroom
  In order to make client's project contents visible to reviewers
  As a Merrill User
  I want to launch a fileroom

  Scenario: Launch fileroom
  	Given I am logged into a project
  	When I go to Content Manager
  	And I go to an unlaunched fileroom
  	And I click the Actions dropdown
  	And I click Launch
  	Then I should see the fileroom summary page with launch date


  
