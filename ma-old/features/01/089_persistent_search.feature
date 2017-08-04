@User
Feature: Search from persistent search box
  In order to search all documents on a project
  As a user
  I want to search for a term

  Scenario: Search from persistent search box
  	Given I am logged into a project
  	When I do search in the project's search box
  	And I open a document that displays in the results
  	Then I should see my search term highlighted in the document



  
