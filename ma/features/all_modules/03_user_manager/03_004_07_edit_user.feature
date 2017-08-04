Feature: Edit User
  In order to manage my users
  As a Site Admin
  I want to Edit a user's information

  @SiteAdmin
  Scenario: Scenario: I am logging in the application and launching inside Hope page
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users
  Scenario: Edit User's Role
    Given Select "Users" from the left pane
    And I select the User Group user
    And I click Edit (content frame)
    And I select role "User Group"
    And I click Save (content frame)
    Then I should see the User details page reflecting the "User Group" role change