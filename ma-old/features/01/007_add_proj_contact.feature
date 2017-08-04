@MerrillUser
Feature: Add project contact
  In order to call out a project's main contact(s)
  As a Merrill user
  I want to add a contact on the project's Tracker page

  Scenario: Add project contact
  	Given I am on a project's Tracker page
  	When I click the Add Contact button
  	And I search the Contact: field with "account,"
  	And I select "house.account@merrillcorp.com" from the dropdown
  	And I click Save (tracker)
  	Then I should see the contact added to the project's Tracker page
  	And the contact's email should be "house.account@merrillcorp.com"

  
