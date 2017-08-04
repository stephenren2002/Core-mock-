Feature: Edit Team
  Editing the Team with multiple combination

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users
  Scenario: Edit Team
    Given  Select "Team" from the left pane
    And click any team from the right pane

  @SiteAdmin @Users
  Scenario Outline: Editing the Team with
    Given Click "Edit Team" button in the green bar
    And Enter <team_label> name
    And click  save
    Then Edit team name should get saved with <name>

    Examples:
      | team_label | name      |
      | 08061985   | 08061985  |
      | A12nu3     | A12nu3    |
      | lowercase  | lowercase |
      | UPPERCASE  | UPPERCASE |