@User
Feature: Ask question with attachment
  In order to call out a document for reference in a question
  As a User
  I want to add an attachment to my question

  Scenario: Ask question with attachment
  	Given I am logged into a project
  	When I go to the Q&A Forum tab
  	And I ask a question with an attachment
  	Then I should see the question with attachment appear in Questions Submitted

  
