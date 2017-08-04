@MerrillUser @smoketest
Feature: Visit the Gmail and Click on the link
  Scenario: Login Gmail and Register the Site Admin User
    Given I visit Gmail
    When I enter the user Credentials
    And I click on submit button
    And I click on the project invitation
    And I click on the project invitation link
    And I enter the username and submit
    Then I should get registration confirmation message