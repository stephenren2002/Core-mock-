@SiteAdmin
Feature: Reorder Index
  In order to change the order of folders and documents on my project
  As a Site Admin
  I want to reorder my index

  Scenario: Reorder Index
  	Given I am logged into a project
  	When I go to the Content Manager tab
  	And I click on the fileroom
  	And I click Actions
  	And I click Reorder Folder Contents
  	And I move some items to new index locations
  	And I click Submit
  	Then I should see the fileroom summary page with items locked for edit

  
