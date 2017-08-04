
Feature: filter View Index report
  In order to view content based on specific criteria in a View Index
  As a User
  I want to utilize the filters in the View Index
  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    When I click on "Index" tab

  @SiteAdmin @SAIndex @UG-Full
  Scenario: Filter View Index report 58416
  	Given I click View Index
  	And I filter for documents in the View Index
  	Then I should see the filtered report


  
