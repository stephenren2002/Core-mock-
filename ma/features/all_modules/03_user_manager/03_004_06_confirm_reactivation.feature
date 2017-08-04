Feature: Confirm user reactivation
  In order to confirm a user was properly reactivated
  As a user
  I want to log in and confirm a project is again listed on my Global Dashboard

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users
  Scenario: Confirm reactivation
    Given I Log Out and Login The application as another user
    And I enter the username and password as User Group
    Then I should see my Global Dashboard that again lists the project I was reactivated from
    Then I Log Out and Login The application as another user
