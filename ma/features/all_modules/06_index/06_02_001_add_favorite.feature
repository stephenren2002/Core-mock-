Feature: Add doc to Favorites
  In order to mark a document for easy access
  As a User
  I want to add a document to my Favorites

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    When I click on "Index" tab

  @SiteAdmin @SAIndex @UG-Full
  Scenario: Add to Favorites
    Given I click on fileroom1 in the Index left side
    And I select the document2 in the Index
    And I click on "Add to Favorites" button in Index green bar
    And I go to Favorites
    Then I should see my document added to Favorites