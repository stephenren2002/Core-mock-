@SiteAdmin
Feature: Add Q&A Forum category
  In order to better organize user's questions
  As a Site Admin
  I want to create a new category in Q&A Forum

  Scenario: Add Q&A category
  	Given I am logged into the project "DS Demo DSv6 Automation zZz"
  	When I go to the Q&A Forum tab
  	And I add the category "Financial"
  	Then I should see the new "Financial" category created

  
