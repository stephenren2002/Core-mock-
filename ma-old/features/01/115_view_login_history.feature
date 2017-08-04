@SiteAdmin
Feature: View Login History
  In order to see a user's logins
  As a Site Admin
  I want to view a user's Login History

  Scenario: View Login History
  	Given I am logged into a project
    When I go to the Users tab
    And I go to Users via the left pane
    And I select the user with email address of "dsv6.automation@gmail.com"
    And I select Login History
    And I select All in the dropdown
  	Then I should see the user's complete login history

  
