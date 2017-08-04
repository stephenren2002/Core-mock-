@SiteAdmin
Feature: Add Team
  In order to create a new reporting group
  As a Site Admin
  I want to create a new Team

  Scenario: Add Team
  Given I am logged into a project
	When I go to the Users tab
	And I go to Teams via the left pane
	And I click Add Team
	And I enter a team label
	And I click Save (content frame)
  Then I should see the new team's detail page

  
