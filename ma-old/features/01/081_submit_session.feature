@MerrillUser
Feature: Submit a session
  In order to process my changes to my project
  As a Merrill User
  I want to submit my open session

  Scenario: Submit session
  	Given I am logged into a project
  	When I go to the Content Manager tab
  	And I click Session Locks in the left pane
  	And I click on my Open session
  	And I click Submit
  	Then I should see the Session Details page

  
