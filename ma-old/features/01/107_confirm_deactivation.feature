Feature: Confirm user deactivation
  In order to confirm a user was properly deactivated
  As a user
  I want to log in and confirm a project is no longer listed on my Global Dashboard

  Scenario: Confirm deactivation
  	Given I am at the Global Dashboard Login page
  	When I enter the username and password
  	When I click on Log In
  	Then I should see my Global Dashboard that does not list the project I was deactivated from

  
