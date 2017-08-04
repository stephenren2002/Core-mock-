
Feature: Invite initial Site Admin
  In order to get the initial admins set up in a new project
  As a Merrill User
  I want to send an invitation to a Site Admin

  Scenario: User is logging in
    Given "Merrill User" logged In
    And I am on a project's Tracker page
    And I select the Project
    And Merrill User click on "Users" tab

  @MerrillUser @smoketest
  Scenario: Invite Site Admin
  	Given Merrill User go to Users Tab
    And Merrill User go to Users via the left pane
    And Merrill User click Add User
  	And Merrill User invite a Site Admin type user
  	Then Merrill User should see confirmation that the invitation was sent

  
