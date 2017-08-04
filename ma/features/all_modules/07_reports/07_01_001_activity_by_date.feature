Feature: Activity by Date report
  In order to view total doc activity by date
  As a Site Admin
  I want to run the Activity by Date report

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    When I click on "Reports" tab

  @SiteAdmin @Reports
  Scenario: Run Activity by Date report
    When I go to the Reports tab
    And I run Activity by Date for all dates
    Then I should see the Activity by Date report display