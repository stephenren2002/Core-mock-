Feature: Answer a question with attachment
  In order to refer a user to a document within my answer
  As a Site Admin
  I want to answer a question with an attachment

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Q&A Forum" tab
    And I go to the Q&A Forum tab

  @SA-QAForum
  Scenario: Answer for a question
    And I select a Submitted question
    And I answer the question with an attachment
    Then I should see the question move to an Answered status

  
