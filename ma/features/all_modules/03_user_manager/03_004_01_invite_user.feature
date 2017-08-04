Feature: Invite User
  In order to give access to a new user
  As a Site Admin
  I want to send a user invitation

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users
  Scenario: Invite User
    Given Select "Users" from the left pane
  	And I click Add User
  	And I invite a User Group type user
  	Then I should see confirmation that the invitation was sent

  
