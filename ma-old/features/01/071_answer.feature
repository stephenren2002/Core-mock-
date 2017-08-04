@SiteAdmin
Feature: Answer a question
  In order to respond to user's questions
  As a Site Admin
  I want to answer a question

  Scenario: Answer a question
  	Given I am logged into a project
  	When I go to the Q&A Forum tab
  	And I select a Submitted question
  	And I answer the selected question
  	Then I should see the question move to an Answered status
