Feature: Edit SA Role


  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users
  Scenario: Edit UG Role
    Given Select "Roles" from the left pane
    And I select "User Group" from drop down
    And click Role from the right pane

  @SiteAdmin @Users
  Scenario Outline: Muliple edit
    And Click "Edit Role" button in the green bar
    And Enter <role_label> name
    And click  save
    Then Edited <name> should get saved

    Examples:
      | role_label | name      |
      | 08061985   | 08061985  |
      | A12nu3     | A12nu3    |
      | lowercase  | lowercase |
      | UPPERCASE  | UPPERCASE |


