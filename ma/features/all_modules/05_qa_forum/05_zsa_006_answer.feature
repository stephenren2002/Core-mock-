Feature: To answer the question as draft, submit for approval and edit the draft, needs approval answer and submit as site admin
  In order to refer a user to a specific document related to their question
  As a Site Admin
  I want to add a See Also to my answer


  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Q&A Forum" tab
    And I go to the Q&A Forum tab

  @SA-QAForum
  Scenario: Draft an answer
  When I select a Submitted question
  And I answer the question
  And I click on Save as draft
  Then I should see the answer appear in draft list


  @SA-QAForum
  Scenario: Submit an answer for approval
    When I select a Submitted question
    And I answer the question
    And I click on Submit for approval
    Then I should see the answer appear in Submit for approval list

  @SA-QAForum
  Scenario: Add Attachment in Needs approval state
    And I select a Submitted question
    And I answer the question
    And I add attachment for the answer
    And I click on Submit for approval
    Then I should see the answer appear in Submit for approval list
    And I should see a document attached to the answer

  @SA-QAForum
  Scenario: Add Attachment in Drafting state
    And I select a Submitted question
    And I answer the question
    And I add attachment for the answer
    And I click on Save as draft
    Then I should see the answer appear in draft list
    And I should see a document attached to the answer

  @SA-QAForum
  Scenario: Add see also in Drafting state
    And I select a Submitted question
    And I answer the question
    And I add see also documents to the answer
    And I click on Save as draft
    Then I should see the answer appear in draft list
    And  I should see the document linked to the answer

  @SA-QAForum
  Scenario: Add see also in Needs approval state
    And I select a Submitted question
    And I answer the question
    And I add see also documents to the answer
    And I click on Submit for approval
    Then I should see the answer appear in Submit for approval list
    And  I should see the document linked to the answer

  @SA-QAForum
  Scenario: Edit and save tne Draft answer
    When I select a drafting answers
    And I Edit the answer
    And I click on Save
    Then I should see the edited answer appear in draft list

  @SA-QAForum
  Scenario: Edit and Submit for approval a draft answer
    When I select a drafting answers
    And I Edit the answer
    And I click on Submit for approval
    Then I should see the edited answer appear in Submit for approval list

  @SA-QAForum
  Scenario: Edit and Submit a Draft answer
    When I select a drafting answers
    And I Edit the answer
    And I click on Submit
    Then I should see the answer appear in Answered status

  @SA-QAForum
  Scenario: Edit and save a Submit for approval answer
    When I select a Answers need approval
    And I Edit the answer
    And I click on Save
    Then I should see the edited answer appear in Submit for approval list

  @SA-QAForum
  Scenario: Edit and submit a Submit for approval answer
    When I select a Answers need approval
    And I Edit the answer
    And I click on Submit
    Then I should see the answer appear in Answered status

  @SA-QAForum
  Scenario: Add,Edit and Delete a category
    When I click on "Q&A Forum" tab
    And I click on Manage Categories
    And I click on New Category
    And I add a new category
    And I Edit the category
    And I Delete the category

