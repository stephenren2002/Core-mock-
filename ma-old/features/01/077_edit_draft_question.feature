@User
Feature: Edit drafted question and submit
  In order to update the content of a question saved as a draft
  As a User
  I want to edit a drafted question

  Scenario: Edit drafted question and submit
  	Given I am logged into a project
  	When I go to the Q&A Forum tab
  	And I select a Drafting question
  	And I edit and submit the question
  	Then I should see the question move to Submitted status

  
