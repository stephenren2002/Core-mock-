Feature: View document
  In order to review project contents
  As a User
  I want to view a document

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    When I click on "Index" tab

  @SiteAdmin @SAIndex @UG-Full @smoketest
  Scenario: View document
    Given I click on fileroom1 in the Index left side
    And I click on first document under Fileroom1 in the Index
    Then I should be able to page through the document