@SiteAdmin
Feature: Edit User
  In order to manage my users
  As a Site Admin
  I want to Edit a user's information

  Scenario: Edit User's Role
  	Given I am logged into a project
    When I go to the Users tab
    And I go to Users via the left pane
    And I select the user "dsv6.automation+user@gmail.com"
    And I click Edit (content frame)
    And I select role "User Group" 
    And I click Save (content frame)
  	Then I should see the User details page reflecting the "User Group" role change