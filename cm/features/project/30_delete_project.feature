#@smoke @regression
#Feature: Delete project
#  As a MerrillPM
#  I want to delete a project
#  So that a project can be cleaned up and closed
#
#  Scenario: Delete a project
#    Given I am logged in as an internal user :merrill_pm
#    And I go to the tracker "Projects" tab
#    And the project "capy" should exist
#    When I close the project "capy"
#    And I delete the project "capy"
#    Then the project "capy" should not exist