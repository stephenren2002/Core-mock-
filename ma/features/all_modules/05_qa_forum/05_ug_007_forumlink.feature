Feature: I want to click all forum links
  As a user I need to validate exact status for the forum links


  Scenario: I am logging in
    Given "User Group" is on Home Page


  @UG-QAForum @UG-Full
  Scenario: Total Questions Asked link in Q&A forum
    Given I click on "Q&A Forum" tab
    Then I should see the Total Questions Asked link for the questions

  @UG-QAForum @UG-Full
  Scenario: Total Questions Drafting link in Q&A forum
    Then I should see the Questions Drafting link for the questions

  @UG-QAForum @UG-Full
  Scenario: Total Questions Needs Approval link in Q&A forum
    Then I should see the Questions Need Approval link for the questions

  @UG-QAForum @UG-Full
  Scenario: Total Questions Submitted link in Q&A forum
    Then I should see the Questions Submitted link for the questions

  @UG-QAForum @UG-Full
  Scenario: Total Questions Answered link in Q&A forum
    Then I should see the Questions Answered link for the questions

  @UG-QAForum @UG-Full
  Scenario: Toal Questions Asked Today link in Q&A forum
    When I select Total Questions Asked Today for the Questions

  @UG-QAForum @UG-Full
  Scenario: Questions Drafting Today link in Q&A forum
    When I select Total Questions Drafting for the Questions

  @UG-QAForum @UG-Full
  Scenario: Questions Needs Approval Today link in Q&A forum
    When I select Total Questions Need Approval for the Questions

  @UG-QAForum @UG-Full
  Scenario: Questions Submitted Today link in Q&A forum
    When I select Total Questions Submitted for the Questions

  @UG-QAForum @UG-Full
  Scenario: Questions Answered Today link in Q&A forum
    When I select Total Questions Answered for the Questions