Feature: Answer question with a See Also
  In order to refer a user to a specific document related to their question
  As a Site Admin
  I want to add a See Also to my answer

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Q&A Forum" tab
    And I go to the Q&A Forum tab

  @SA-QAForum
  Scenario: Answer question with a See Also
    And I select a Submitted question
    And I answer the question with a See Also
    Then I should see the document linked in the answer

  
