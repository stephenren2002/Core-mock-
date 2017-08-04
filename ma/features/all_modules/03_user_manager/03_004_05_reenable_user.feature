Feature: Reactivate User
  In order to reinstate access for a disabled user
  As a Site Admin
  I want to change a disabled user to his previous status

  @SiteAdmin @Users
  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users
  Scenario: Reactivate User
    Given Select "Users" from the left pane
    And I select the User Group user
    And I click Change to Previous Status
    Then I should see confirmation that the user is in an enabled status