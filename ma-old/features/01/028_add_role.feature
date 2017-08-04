@SiteAdmin
Feature: Add Role
  In order to give a new combo of document security to users
  As a Site Admin
  I want to add a new Role

  Scenario: Add Role
  	Given I am logged into a project
    When I go to the Users tab
    And I go to Roles via the left pane
  	And I click Add Role
  	And I enter a role label
  	And I click Save (content frame)
  	And I click Save (content frame)
  	Then I should see the new role's detail page

  
