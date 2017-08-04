Feature: Add Role
  In order to give a new combo of document security to users
  As a Site Admin
  I want to add a new Role

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    Given I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users @smoketest
  Scenario: Add UG Role
    And I go to the Users tab
    Given Select "Roles" from the left pane
    And I click Add Role
    And I enter a UG role name for a role
    And I click Save (content frame)
    And I click Save (content frame)
    Then I should see the new role's detail page

  @SiteAdmin @Users
  Scenario: Add SA Role
    Given Select "Roles" from the left pane
    And I click Add Role
    And I select "Site Manager" role
    And I enter a SA role name for a role
    And I click Save (content frame)
    And I click Save (content frame)
    Then I should see the new SA role's detail page

  @SiteAdmin @Users
  Scenario: Edit SA Role
    Given Select "Roles" from the left pane
    And I open created Site Manager role
    And I click on Edit Role button
    And I edit role title
    And I select Q&A forum
    And I click Save (content frame)
    Then I should see the Edited SA role's detail page

  @SiteAdmin @Users
  Scenario: Delete SA Role
    Given Select "Roles" from the left pane
    And I open edited Site Manager role
    And I click on "Delete" in role page
    And I should not see the deleted role in list