Feature: I am launching the stage url and trying to login through
  @MerrillUser @Tracker @smoketest
  Scenario: Login the Datasite application as Merrill user
    Given I am in Datasite Login Page
    When I am logging in as a "Merrill User"
    And I press the "Submit" button
    Then I should be in "DataSite " Global Dashboard

  @SiteAdmin @Users @Settings @SA-QAForum @SAIndex
  Scenario: Login the Datasite application as Site Admin
    Given I am in Datasite Login Page
    When I am logging in as a "Site Admin"
    And I press the "Submit" button
    Then I should be in "DataSite " Global Dashboard

  @UserGroup @UG-QAForum @UG-Full @UG-QAEdit
  Scenario: Login the Datasite application as Site Admin
    Given I am in Datasite Login Page
    When I am logging in as a "User Group"
    And I press the "Submit" button
    Then I should be in "DataSite " Global Dashboard