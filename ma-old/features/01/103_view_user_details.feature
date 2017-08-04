@SiteAdmin
Feature: View user details
  In order to look up a user's information
  As a Site Admin
  I want to view a user's details page

  Scenario: View user details
  	Given I am logged into a project
    When I go to the Users tab
    And I go to Users via the left pane
    And I select the user with email address of "dsv6.automation@gmail.com"
  	Then I should see the details page of user with email address "dsv6.automation@gmail.com"

  
