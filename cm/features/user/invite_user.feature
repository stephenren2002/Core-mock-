Feature: Invite Users
  As a user
  I want to invite users
  So they can use the application

# should generate username
  @bootstrap
  Scenario: Invite a Merrill PM
    Given a user "DataSiteITServices" exists
    And I go to the tracker "Profiling" tab
    When I enter the user "seluser" information
    Then the user "seluser" should be created