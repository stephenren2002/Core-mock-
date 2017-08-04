Feature: Submit question for Needs Approval
  In order to submit a question for Submit for Approval
  As a user
  I want to submit a question for approval

  Scenario: I am logging in
    Given "User Group" is on Home Page
    And I click on "Q&A Forum" tab
    And I go to the Q&A Forum tab

  @UG-QAForum @UG-Full @UG-QAEdit
  Scenario: Submit for Approval question
    And I click on "Q&A Forum" tab
    And I submit a question for approval
    Then I should see the question appear in Questions Needs Approval
