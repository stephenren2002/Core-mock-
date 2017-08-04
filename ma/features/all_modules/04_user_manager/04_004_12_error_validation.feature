Feature: Error Validation in Add User page
  In order to give access to a new user
  As a Site Admin
  I want to send a user invitation

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users
  Scenario: Error Validation in Add User page without enter all fields clicking on send invite
    Given Select "Users" from the left pane
    And I click Add User
    When I click on "Send Invite" button
    Then I should see error validation in the add user page


  @SiteAdmin @Users
  Scenario: Error Validation in Add User page without enter all fields clicking on save invite
    Given Select "Users" from the left pane
    And I click Add User
    When I click on "Save Invite" button
    Then I should see error validation in the add user page




