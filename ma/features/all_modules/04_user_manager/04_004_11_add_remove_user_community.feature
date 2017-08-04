Feature: Remove and Add user from community


  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    When I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users
  Scenario: Remove User from Community
  When Select "Communities" from the left pane
  And  I select "Community1" in the right panel
  And Click "Remove User" button in the green bar
  And select user to remove
  And Click "Remove" button in the green bar
  Then Verify if the user is removed

  @SiteAdmin @Users
  Scenario: Add User from Community
    When  Select "Communities" from the left pane
    And I select "Community1" in the right panel
    And Click "Add User" button in the green bar
    And Select user to add
    And Click "Add" button in the green bar
    Then Verify if the user is added


