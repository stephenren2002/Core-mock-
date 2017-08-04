Feature: Ask question with attachment
  In order to call out a document for reference in a question
  As a User
  I want to add an attachment to my question

  Scenario: I am logging in
    Given "User Group" is on Home Page
    And I click on "Q&A Forum" tab
    And I go to the Q&A Forum tab

  @UG-QAForum @UG-Full
  Scenario: Ask question with attachment
    And I ask a question with an attachment
    Then I should see the question with attachment appear in Questions Submitted

  
