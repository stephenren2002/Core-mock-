@User
Feature: Save question as draft
  In order to save a drafted question without submitting
  As a user
  I want to save a draft of a question

  Scenario: Save question draft
  	Given I am logged into a project
  	When I go to the Q&A Forum tab
  	And I save a question as a draft
  	Then I should see the question appear in Questions Drafting

  
