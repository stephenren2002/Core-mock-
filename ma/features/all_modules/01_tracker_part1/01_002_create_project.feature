
Feature: Create project
  As a Tracker user
  I want to create a new project


	Scenario: User is logging in
	    Given "Merrill User" logged In

@MerrillUser @smoketest
	Scenario: Create project
		Given I am on the Tracker home page
		When I click the Add Project button
		When I check the Demo checkbox
		And I enter the Project Name
		And I enter "Sample" as Company
		And I select "Sample Company" from Company dropdown
		And I select "Company" from Deal Source dropdown
		And I enter "account" as PM
		And I select "Account, House" as PM
		And I enter "account" as Sales
		And I select "Account, House" as Sales
		And I enter "account" as DS Sales
		And I select "Account, House" as DS Sales
		And I select "Asset Sale" as the DataSite Type
		And I select "United States" as the Country of Issuer
		And I select "STP" as the Revenue Site
		And I select "STP" as the Project Managing Site
		And I enter "n/a" as the SA Number
		And I enter "n/a" as the Credit Check Number
		And I enter "n/a" as the Credit Check Cap
	    And I check teridion for teridion project
		And I click Submit (tracker)
		And I check the New Project, Continue checkbox and Submit
		And I click Submit (tracker)
		Then I should see the new project's Tracker page
	
  
