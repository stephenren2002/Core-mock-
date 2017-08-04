Feature: Run Activity Timeline report
  In order to see document activity over time
  As a Site Admin
  I want to view the Activity Timeline report


  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    When I click on "Reports" tab
    And I go to the Reports tab

  @SiteAdmin @Reports
  Scenario: Activity Timeline report
    Given I run Activity Timeline for all dates, all roles
    Then I should see the Activity Timeline report display