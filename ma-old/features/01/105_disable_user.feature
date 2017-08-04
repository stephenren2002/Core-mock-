@SiteAdmin
Feature: Disable User
  In order to remove a user's project access
  As a Site Admin
  I want to disable a user

  Scenario: Disable User
  	Given I am logged into a project
    When I go to the Users tab
    And I go to Users via the left pane
    And I select the user "dsv6.automation+user@gmail.com"
    And I click Deactivate
  	Then I should see confirmation that the user is in a disabled status

  
