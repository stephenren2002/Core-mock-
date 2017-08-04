Feature: I am launching the stage url and validating all data centers are available in dashboard


  @Tracker
  Scenario: Validating all Data centers are avaialble in dashboard
    Given I am in Datasite Login Page
    When I am logging in as a "Merrill User"
    And I press the "Submit" button
    Then I should be in "DataSite " Global Dashboard

  @MerrillUser
  Scenario: Validating all Data centers are avaialble in dashboard
    Then I should see all data centers in dashboard