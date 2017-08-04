Feature: Search within Q&A Forum
  In order to find specific questions/answers
  As a Site Admin
  I want filter for certain criteria and search in the Q&A forum

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Q&A Forum" tab
    And I go to the Q&A Forum tab

  @SA-QAForum
  Scenario: Q&A search
    Given I search for answers submitted by the Automation Community
    Then I should see results populate