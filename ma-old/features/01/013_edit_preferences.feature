@SiteAdmin
Feature: Edit Preferences
  In order to change my project alert preferences
  As a Site Admin
  I want to edit my New Document Alert frequency

  Scenario: Edit Preferences
  	Given I am logged into a project
  	When I click on Preferences
  	And I click Edit (preferences)
  	And I select Weekly for New Documents Uploaded alerts
  	And I click Save (preferences)
  	Then I should see my Preferences summary with New Document alerts set to Weekly

  
