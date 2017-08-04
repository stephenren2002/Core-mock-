@SiteAdmin
Feature: Edit folder title
  In order to organize my project content
  As a Site Admin
  I want to change the title of an existing folder

  
Scenario: Edit folder title
	Given I am logged into a project
  	When I go to the Content Manager tab
    And I edit the title of a folder
  	And I click Save (content frame)
	Then I should see my folder's details page
