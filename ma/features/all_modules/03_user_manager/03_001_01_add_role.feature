Feature: Add Role
  In order to give a new combo of document security to users
  As a Site Admin
  I want to add a new Role

  Scenario: I am logging in
    Given "Site Admin" is on Home Page

  @SiteAdmin @Users
  Scenario: Add UG Role
    Given I click on "Users" tab
    And I go to the Users tab
    And Select "Roles" from the left pane
    And I click Add Role
    And I enter a UG role name for a role
    And I click Save (content frame)
    And I click Save (content frame)
    Then I should see the new role's detail page