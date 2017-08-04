Feature: Cancel pending workorder
  In order to cancel a workorder that no longer needs to be done
  As a Merrill User
  I want to cancel a workorder that is in a pending status

  Scenario: loging in as Merrill user
    Given "Merrill User" logged In
    And I am on a project's Tracker page
  @Tracker
 Scenario: Cancel a workorder in a Pending status
    Given I move to project detail page
 	When I cancel a workorder that's in a pending status
 	Then I should see the workorder move to a cancelled status

  
