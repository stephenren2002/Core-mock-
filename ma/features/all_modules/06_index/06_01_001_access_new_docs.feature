Feature: Access New Documents
  In order to see a list of only documents added since my last login
  As a User
  I want to access New Documents

  Scenario: I am logging in
    Given "Site Admin" is on Home Page


  @SiteAdmin @SAIndex @UG-Full
  Scenario: Access New Documents
#    Given I click on "Index" tab
    And I go to the Index tab
    And I click on the New Documents link
    Then I should see a listing of documents added since my last login