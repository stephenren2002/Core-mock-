
Feature: Edit project Primary Information,project details,Add project contact
  As a Tracker user
  Scenario1#I want to edit a project's Primary Information
  Scenario2#I want to edit the Project Details section in Tracker
  Scenario3#I want to add a contact on the project's Tracker page

	Scenario: User is logging in
		Given "Merrill User" logged In
		And I am on a project's Tracker page

@MerrillUser
  	Scenario: Edit project Primary Information
		Given I click Edit in Primary Information section
		When I select "Central" in the End Client Region dropdown
		And I select "CHI (Chicago)" in the Time Zone dropdown
		And I add "12345" as the SA Number
		And I click Submit (tracker)
		Then I should return to the project's Tracker page
		And I should see the End Client region updated to "Central"
		And I should see the Time Zone display as "America/Chicago"
		And I should see the SA Number updated to "12345"

@MerrillUser
	Scenario: Edit project details
		Given I click Edit in the Project Details section
		When I select "Site admin only" in the Live Chat dropdown
		And I set the Page Threshold to "10000"
		And I set the HTML uploader as default
		And I click the Submit (tracker)
		Then I should return to the project's Tracker page
		And I should see Live Chat updated to "Site admin only"
		And I should see the Page Threshold updated to "10000"

@MerrillUser
	Scenario: Add project contact
		Given I click the Add Contact button
		When I search the Contact: field with "account, House"
		And I select "house.account@merrillcorp.com" from the dropdown
		And I click Save (tracker)
		Then I should see the contact added to the project's Tracker page
		And the contact's email should be "house.account@merrillcorp.com"
  
