Feature: QA Forum Test
  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Q&A Forum" tab
    And I go to the Q&A Forum tab

  @SA-QAForum
  Scenario: To verify the tab
    And I select a Submitted question
    And I answer the selected question
    Then I should see the question move to an Answered status
