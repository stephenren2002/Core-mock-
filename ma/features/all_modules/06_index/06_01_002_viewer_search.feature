Feature: Search from within viewer
  In order to search within a single document
  As a user
  I want to search within the document viewer

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    When I click on "Index" tab

  @SiteAdmin @SAIndex @UG-Full
  Scenario: Search from viewer
    Given I click on fileroom1 in the Index left side
    And I click on first document under Fileroom1 in the Index
    And I conduct a search
    Then I should see my search term highlighted in the document

  
