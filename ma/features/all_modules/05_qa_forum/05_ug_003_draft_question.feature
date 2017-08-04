Feature: Save question as draft
  In order to save a drafted question without submitting
  As a user
  I want to save a draft of a question

  Scenario: I am logging in
    Given "User Group" is on Home Page
    And I click on "Q&A Forum" tab
    And I go to the Q&A Forum tab

  @UG-QAForum @UG-Full
  Scenario: Save question draft
    And I save a question as a draft
    Then I should see the question appear in Questions Drafting

  
