@User
Feature: Access Help
	In order to find answers to my question
	As a User
	I want to access the help content

  Scenario: View My Dashboard help page
  	Given I am on my Global Dashboard page
  	When I click the Help link
  	Then I should see a new window open displaying the My Dashboard help page

  