Feature: Ask a question
  In order to get more information
  As a user
  I want to ask a question

  Scenario: I am logging in
    Given "User Group" is on Home Page


  @UG-QAForum @UG-Full
  Scenario: Ask a question
    Given I click on "Q&A Forum" tab
    And I go to the Q&A Forum tab
    And  I ask a question
    Then I should see the question appear in Questions Submitted