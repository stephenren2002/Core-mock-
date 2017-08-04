Feature: Disable User
  In order to remove a user's project access
  As a Site Admin
  I want to disable a user

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users
  Scenario: Disable User
    Given Select "Users" from the left pane
    And I select the User Group user
    And I click Deactivate
    Then I should see confirmation that the user is in a disabled status

  
