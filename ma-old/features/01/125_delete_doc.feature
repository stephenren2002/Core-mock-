@SiteAdmin
Feature: Delete document
  In order to remove a document that is not needed from my project
  As a Site Admin
  I want to delete a document

  Scenario: Delete a document
  	Given I am logged into a project
  	When I go to the Content Manager tab
  	And I click on the fileroom
  	And I click on a document
  	And I click on Actions
  	And I click on Delete
  	Then I should see the document marked for deletion in the fileroom summary

  
