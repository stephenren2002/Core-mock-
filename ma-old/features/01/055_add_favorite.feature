@User
Feature: Add doc to Favorites
  In order to mark a document for easy access
  As a User
  I want to add a document to my Favorites

  Scenario: Add to Favorites
  	Given I am logged into a project
  	When I go to the Index tab
  	And I go to a fileroom
    And I add a document to my favorites
    And I go to Favorites
  	Then I should see my document added to Favorites 

  
