@SiteAdmin
Feature: Invite User
  In order to give access to a new user
  As a Site Admin
  I want to send a user invitation

  Scenario: Invite User
  	Given I am logged into a project
    When I go to the Users tab
    And I go to Users via the left pane
  	And I click Add User
  	And I invite a User Group type user
  	Then I should see confirmation that the invitation was sent

  
