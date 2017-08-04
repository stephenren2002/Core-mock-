Feature: Login as site admin
  As a site admin
  I want to login
  So I can access my project

  Scenario: Login as site admin
  	Given I am at the Global Dashboard Login page
  	When I enter the username "dsv6.automation@gmail.com"
  	And I enter the password "Qwert123!"
  	When I click on Log In
  	Then I should see my Global Dashboard

  
