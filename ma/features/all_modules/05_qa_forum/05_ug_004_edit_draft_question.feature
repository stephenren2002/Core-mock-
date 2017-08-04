Feature: Edit drafted question and save
  In order to update the content of a question saved as a draft
  As a User
  I want to edit a drafted question and save

  Scenario: I am logging in
    Given "User Group" is on Home Page
    And I click on "Q&A Forum" tab
    And I go to the Q&A Forum tab

  @UG-QAForum @UG-Full @UG-QAEdit
  Scenario: Edit drafted question and save
    And I go to the Q&A Forum tab
    And I select a Drafting question for save as draft


  @UG-QAForum @UG-Full @UG-QAEdit
  Scenario: Edit drafted question and submit for Approval
    And I select a Drafting question for Submit for Approval

  @UG-QAForum @UG-Full @UG-QAEdit
  Scenario: Edit drafted question and submit
    And I select a Drafting question for submit

  @UG-QAForum @UG-Full @UG-QAEdit
  Scenario: Drafted question and submit for Approval
    And I select a Drafting question for SFA

  @UG-QAForum @UG-Full @UG-QAEdit
  Scenario: Drafted question and submit
    And I select a Drafting question for direct Submit