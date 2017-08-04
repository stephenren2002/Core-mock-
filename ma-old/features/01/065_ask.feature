@User
Feature: Ask a question
  In order to get more information
  As a user
  I want to ask a question

  Scenario: Ask a question
    Given I am logged into a project
  	When I go to the Q&A Forum tab
  	And I ask a question
  	Then I should see the question appear in Questions Submitted

  
