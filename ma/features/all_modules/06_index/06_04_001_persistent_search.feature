
Feature: Search from persistent search box
  In order to search all documents on a project
  As a user
  I want to search for a term

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    When I click on "Index" tab

  @SiteAdmin @SAIndex @UG-Full
  Scenario: Search from persistent search box
  	When I do search in the project's search box
  	And I open a document that displays in the results
  	Then I should see my search term highlighted in the document



  
