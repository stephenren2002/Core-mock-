Feature: I want to filtering for all drop downs
  As a user I need to validate exact status for the filter


  Scenario: I am logging in
    Given "User Group" is on Home Page


  @UG-QAForum @UG-Full
  Scenario: Questions Submitted Filter in Q&A forum
    Given I click on "Q&A Forum" tab
   Then I should see the Questions Submitted status for the questions


  @UG-QAForum @UG-Full
  Scenario: Questions Drafting Filter in Q&A forum
    Then I should see the Questions Drafting status for the questions

  @UG-QAForum @UG-Full
  Scenario: Questions Needs Approval Filter in Q&A forum
    Then I should see the Questions Need Approval status for the questions

  @UG-QAForum @UG-Full
  Scenario: Questions Answered Filter in Q&A forum
    Then I should see the Questions Answered status for the questions

  @UG-QAForum @UG-Full
  Scenario: Low Priority Filter in Q&A forum
    Given I click on "Q&A Forum" tab
    Then I should see the Low Priority for the questions

  @UG-QAForum @UG-Full
  Scenario: Medium Priority Filter in Q&A forum
    Then I should see the Medium Priority for the questions

  @UG-QAForum @UG-Full
  Scenario: High Priority Filter in Q&A forum
    Then I should see the High Priority for the questions

  @UG-QAForum @UG-Full
  Scenario: Category Filter in Q&A forum
    Given I click on "Q&A Forum" tab
    Then I should see the General Category for the questions



