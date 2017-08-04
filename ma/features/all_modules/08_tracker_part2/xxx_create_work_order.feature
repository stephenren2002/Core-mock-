@MerrillUser @wip
Feature: Create Work Order
  In order to request media, content copy, etc on a project
  As a Merrill User
  I want to create a Work Order

  Scenario: Create Work Order
  	Given I am on a project's Tracker page
  	When I complete and submit the form for a media work order
  	And I select the Requested Items
  	And I Release to Prod
  	Then I should see the work order details page with status as pending

  
