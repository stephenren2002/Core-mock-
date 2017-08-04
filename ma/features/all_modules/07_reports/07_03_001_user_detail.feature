Feature: User Detail report
  In order to see users' specific document activity
  As a Site Admin
  I want to run the User Detail report

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    When I click on "Reports" tab
    And I go to the Reports tab

  @SiteAdmin @Reports
  Scenario: Run User Detail report
    Given I run User Detail report
    Then I should see the User Detail report display