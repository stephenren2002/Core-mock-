@SiteAdmin
Feature: Create fileroom
As a user with access to Content Manager 
I want to add a new fileroom 
So I can organize my documents


Scenario: Add new fileroom
	Given I am logged into a project
	When I go to the Content Manager tab
	When I click the Add dropdown
	When I click Add Fileroom button
	When I enter a name in the textbox
	When I click Save (content frame)
	Then I should see my new fileroom's details page
	And the fileroom should be on the left pane navigation tree


