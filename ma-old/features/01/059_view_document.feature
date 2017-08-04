@User
Feature: View document
  In order to review project contents
  As a User
  I want to view a document

  Scenario: View document
  	Given I am logged into a project
  	When I go to the Index tab
  	And I go to a fileroom
  	And I select a document
  	Then I should be able to page through the document
  
