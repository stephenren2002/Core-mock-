@SiteAdmin
Feature: Add a placeholder
  In order to better organize my content
  As a Site Admin
  I want to add a new placeholder

 Scenario: Add a placeholder
  Given I am logged into a project
  When I go to the Content Manager tab
  And I add a placeholder
  When I click Save (content frame)
  Then I should see my fileroom summary with newly created placeholder listed
  
