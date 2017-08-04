
Feature: Open doc from View Index
  In order to easily find and open documents
  As a User
  I want to open a document from the View Index report

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    When I click on "Index" tab

  @SiteAdmin @SAIndex @UG-Full
  Scenario: Open doc from View Index
    Given I click a document in the View Index
    And I select specific document in the View Index
  	Then I should see the document open in the viewer

  
