Feature: Printer Friendly Activity Timeline
  In order to get printer friendly report graphics
  As a Site Admin
  I want to access the printer friendly report versions

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    When I click on "Reports" tab
    And I go to the Reports tab

  @SiteAdmin @Reports
  Scenario: Printer Friendly Activity Timeline
    Given I run Activity Timeline for all dates, all roles
    And I click Printer Friendly Version
    Then I should see the report open in a new window