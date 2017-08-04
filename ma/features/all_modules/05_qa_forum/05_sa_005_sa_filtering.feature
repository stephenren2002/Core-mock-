Feature: I want to filtering for all drop downs
  As a user I need to validate exact status for the filter


  Scenario: I am logging in
    Given "Site Admin" is on Home Page


  @SA-QAForum
  Scenario: Filtering in Q&A forum
    Given I click on "Q&A Forum" tab
    And I go to the Q&A Forum tab
    #Then I should see the All status for the questions
    Then I should see the Questions Submitted status for the questions
    Then I should see the Answers Drafting status for the questions
    Then I should see the Answers Need Approval status for the questions
    Then I should see the Answers Submitted status for the questions
    #Then I should see the All Priority for the questions
    #Then I should see the Low Priority for the questions
    #Then I should see the Medium Priority for the questions
    #Then I should see the High Priority for the questions
    #Then I should see the General Category for the questions