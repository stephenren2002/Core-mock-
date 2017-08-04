Feature: View Login History
  In order to see a user's logins
  As a Site Admin
  I want to view a user's Login History

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users
  Scenario: View Login History
    Given Select "Users" from the left pane
	And I select the user with email address of "dsv6.automation@gmail.com"
    And I select Login History
    And I select All in the dropdown
    Then I should see the user's complete login history

  
