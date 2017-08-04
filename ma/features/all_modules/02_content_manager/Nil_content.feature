@wip
Feature: content test

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Content Manager" tab

  @SiteAdmin
  Scenario: To verify the tab
    When I click on "Content Manager" tab
#    And I go to an unlaunched filerooms
#    And I click the Actions dropdowns
#    And I click Launchs
#    Then I should see the fileroom summary page with launch dates