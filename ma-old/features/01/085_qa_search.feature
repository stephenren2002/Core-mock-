@SiteAdmin
Feature: Search within Q&A Forum
  In order to find specific questions/answers
  As a Site Admin
  I want filter for certain criteria and search in the Q&A forum

  Scenario: Q&A search
  	Given I am logged into a project
  	When I go to the Q&A Forum tab
  	And I search for answers submitted by the Automation Community
  	Then I should see results populate 

  
