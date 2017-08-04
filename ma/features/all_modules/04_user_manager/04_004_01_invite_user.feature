Feature: Invite Existing User
  In order to give access to a new user
  As a Site Admin
  I want to send a user invitation

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users @smoketest
  Scenario: Invite Existing User
    Given Select "Users" from the left pane
  	And I click Add User
  	And I invite a User Group type user
  	Then I should see confirmation that the invitation was sent

  
