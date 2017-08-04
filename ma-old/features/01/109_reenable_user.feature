@SiteAdmin
Feature: Reactivate User
  In order to reinstate access for a disabled user
  As a Site Admin
  I want to change a disabled user to his previous status

  Scenario: Reactivate User
  	Given I am logged into a project
    When I go to the Users tab
    And I go to Users via the left pane
    And I select the user "dsv6.automation+user@gmail.com"
    And I click Change to Previous Status
  	Then I should see confirmation that the user is in an enabled status


  
