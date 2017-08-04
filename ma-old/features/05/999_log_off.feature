Feature: Log off from Global Dashboard
  In order to end my session
  As a Site Admin
  I want to log off from my global dashboard

  Scenario: Log off from Global Dashboard
  	Given I am logged into a project
  	When I click Log Off
	And I click Yes to continue
  	Then I should see the Sign Off Successful page

  
