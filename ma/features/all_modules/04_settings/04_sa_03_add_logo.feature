
Feature: Add Logo
  In order to personalize my project with a logo
  As a Site Admin
  I want to add and apply a new logo

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Settings" tab
    And I go to the Settings tab


  @SiteAdmin @Settings
  Scenario: Add Logo
    Given I click on "Logos" in left panel of settings tab
    And I attach a logo
    Then I should see my uploaded file in the upper right corner of my project



  
