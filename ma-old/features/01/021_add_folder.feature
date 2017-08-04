@SiteAdmin
Feature: Add a folder
  In order to better organize my documents
  As a Site Admin
  I want to add a new folder


  Scenario: Add a folder
  	Given I am logged into a project
  	When I go to the Content Manager tab
  	And I click on the fileroom
  	And I click the Add dropdown
  	And I click Add Folders
  	And I enter text in the Name(s) text area
    When I click Save (content frame)
  	Then I should see my fileroom summary with newly created folder listed

  
