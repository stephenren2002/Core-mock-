@mu @wip
Feature: Reprocess a document
  In order to adjust some aspect of a document
  As a Merrill User
  I want to send a document to be reprocessed

  Scenario: Reprocess document
  	Given I am logged into a project
  	When I go to the Content Manager tab
  	And I click on the fileroom
  	And I click on a document
  	And I click on Actions
  	And I click on Reprocess Automatically in Color
  	And I click Session Locks in the left pane
  	And I click on my Open session 
  	Then I should see my document with the Reprocess Manually type listed

  
