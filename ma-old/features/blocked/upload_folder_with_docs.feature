@SiteAdmin
Feature: Upload documents
  In order to add content to my project
  As a Site Admin
  I want to upload documents

  Scenario: Upload documents
  	Given I am logged into a project
  	When I go to the Content Manager tab
  	And I click on the fileroom
  	And I click the Add dropdown
  	And I click Add Documents
  	And I complete the Add Documents wizard
  	Then I should see an open session with docs in it

  
