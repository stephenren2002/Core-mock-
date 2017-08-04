@MerrillUser
Feature: Approve a Session
  In order to publish changes to a project
  As a Merrill User
  I want to Approve my Needs Approval session

  Scenario: Approve Session
  	Given I am logged into a project
  	When I go to the Content Manager tab
  	And I click Session Locks in the left pane
  	And I click on my Needs Approval session
  	And I click Approve
  	Then I should see the Session Locks page and my session is not listed

  
