@User
Feature: Download document
  In order to have a native copy of a document
  As a User
  I want to download the document

  Scenario: Download a document
  	Given I am logged into a project
  	When I go to the Index tab
  	And I go to a fileroom
  	And I download a document
  	Then I should have the document saved to my system

  
