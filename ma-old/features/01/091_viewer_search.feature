@User
Feature: Search from within viewer
  In order to search within a single document
  As a user
  I want to search within the document viewer

Scenario: Search from viewer
  	Given I am logged into a project
  	When I go to the Index tab
  	And I go to a fileroom
  	And I select a document
  	And I conduct a search
  	Then I should see my search term highlighted in the document

  
