Feature: Edit the community

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users
  Scenario: Edit Community
    Given Select "Communities" from the left pane
    And I select "Community1" in the right panel
    And Click "Edit Community" button in the green bar
    And I select All Community Members radio button
    And Click "Save" button in the green bar
    Then Submit Enabled status should be for All members
