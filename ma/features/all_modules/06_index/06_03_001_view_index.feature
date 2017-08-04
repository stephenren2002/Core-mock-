Feature: Run View Index
  In order to view a list of all content I have access to
  As a User
  I want to run a View Index report

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    When I click on "Index" tab

  @SiteAdmin @SAIndex @UG-Full
  Scenario: Run View Index
    Given I click View Index
    Then I should see the report in a new window