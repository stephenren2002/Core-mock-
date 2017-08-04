Feature: Run Q&A Forum Activity report
  In order to review all Q&A Forum activity
  As a Site Admin
  I want to run the Q&A Forum Activity report

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    When I click on "Reports" tab
    And I go to the Reports tab

  @Reports @SA-QAForum
  Scenario: Run Q&A Forum Activity report
    Given I click on "Reports" tab
    And I go to the Reports tab
    And I run Q&A Forum Activity for all dates
    Then I should see the Q&A Forum Activity report display