@User
Feature: filter View Index report
  In order to view content based on specific criteria in a View Index
  As a User
  I want to utilize the filters in the View Index

  Scenario: Filter View Index report
  	Given I am logged into a project
  	When I go to the Index tab
  	And I click View Index
  	And I filter for documents
  	Then I should see the filtered report

  
