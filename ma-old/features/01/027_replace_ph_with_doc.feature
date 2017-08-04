@SiteAdmin
Feature: Replace placeholder with document
  In order to update a placeholder with a document
  As a Site Admin
  I want to replace placeholder with a document

  Scenario: Replace placeholder with a document
  	Given I am logged into a project
  	When I go to the Content Manager tab
    And I replace a placeholder with another document
  	And I click Session Locks in the left pane
  	And I click on my Open session 
  	Then I should see my placeholder with the Replace EDoc type listed

  
