@MerrillUser
Feature: Invite initial Site Admin
  In order to get the initial admins set up in a new project
  As a Merrill User
  I want to send an invitation to a Site Admin

  Scenario: Invite Site Admin
  	Given I am logged into a project
    When I go to the Users tab
    And I go to Users via the left pane
  	And I click Add User
  	And I invite a Site Admin type user
  	Then I should see confirmation that the invitation was sent

  
