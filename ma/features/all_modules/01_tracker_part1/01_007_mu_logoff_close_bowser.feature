
Feature: I am logging out the application and Quiting the browser

  Scenario: I am logging in
    Given "Merrill User" is on Home Page

@MerrillUser @smoketest
  Scenario: Logging out of browser
    Given Merrill User clicks logoff
    When Merrill User clicks Yes button
    Then Merrill User should see the Sign Off Successful page