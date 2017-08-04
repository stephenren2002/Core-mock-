Feature: Confirm user reactivation
  In order to confirm a user was properly reactivated
  As a user
  I want to log in and confirm a project is again listed on my Global Dashboard

  Scenario: Confirm reactivation
  	Given I am at the Global Dashboard Login page
  	When I enter the username and password
  	When I click on Log In
  	Then I should see my Global Dashboard that again lists the project I was reactivated from