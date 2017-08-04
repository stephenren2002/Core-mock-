Feature: View user details
  In order to look up a user's information
  As a Site Admin
  I want to view a user's details page

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users
  Scenario: View user details
    Given Select "Users" from the left pane
	And I select the user with email address of "dsv6.automation@gmail.com"
	Then I should see the details page of user with email address "dsv6.automation@gmail.com"

  
