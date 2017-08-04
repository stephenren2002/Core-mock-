@ContentManager
Feature: Create fileroom
  As a user with access to Content Manager
  I want to add a new fileroom
  So I can organize my documents

  Scenario: I am logging in
     Given "Tracker" is on Home Page

  @MerrillUser @smoketest
  Scenario: Merrill user creates File Room
    Given I select the Project
    When Merrill User launch the project
    And Merrill User click the Add dropdown
    And Merrill User click Add Fileroom button
    And Merrill User create multiple Fileroom
    And Merrill User fileroom should be on the left pane navigation tree