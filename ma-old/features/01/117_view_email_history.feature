@SiteAdmin
Feature: View Email History
  In order to see the emails sent to a user
  As a Site Admin
  I want to view a user's Email History

  Scenario: View Email History
  	Given I am logged into a project
    When I go to the Users tab
    And I go to Users via the left pane
    And I select the user with email address of "dsv6.automation@gmail.com"
    And I select Email History
  	Then I should see the user's email history