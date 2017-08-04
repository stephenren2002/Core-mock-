Feature: Confirm user deactivation
  In order to confirm a user was properly deactivated
  As a user
  I want to log in and confirm a project is no longer listed on my Global Dashboard

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users
  Scenario: Confirm deactivation
    Given I Log Out and Login The application as another user
  	When I enter the username and password as User Group
  	And I should see my Global Dashboard that does not list the project I was deactivated from
    Then I Log Out and Login The application as another user