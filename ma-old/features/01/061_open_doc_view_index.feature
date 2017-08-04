@User
Feature: Open doc from View Index
  In order to easily find and open documents
  As a User
  I want to open a document from the View Index report

  Scenario: Open doc from View Index
  	Given I am logged into a project
  	When I go to the Index tab
  	And I click a document in the View Index
  	Then I should see the document open in the viewer

  
