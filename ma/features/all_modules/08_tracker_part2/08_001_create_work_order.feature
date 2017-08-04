Feature: Create Work Order
  In order to request media, content copy, etc on a project
  As a Merrill User
  I want to create a Work Order

  Scenario: loging in as Merrill user
    Given "Merrill User" logged In

  @Tracker
  Scenario: Create Work Order1
    Given I am on a project's Tracker page1
    And I complete and submit the form for a media work order1
    And I select the Requested Items1
    And I Release to Prod1
    Then I should see the work order details page with status as pending1


