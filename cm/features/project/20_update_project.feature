#@regression
#Feature: Update project
#  As a MerrillPM
#  I want to update a project
#  So that a project can be modified as needed
#
#  Scenario: Rename a project
#    Given I am logged in as an internal user :merrill_pm
#    And I go to the tracker "Projects" tab
#    And the project "capynew1" should exist
#    When I edit the key details of the project "capynew1"
#    And I rename the project "capynew1" to "capy"
#    Then the project "capynew1" should have the new name "capy"