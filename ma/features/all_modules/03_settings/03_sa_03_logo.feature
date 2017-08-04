
Feature: Add Logo
  In order to personalize my project with a logo
  As a Site Admin
  I want to add and apply a new logo

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Settings" tab
    And I go to the Settings tab


  @SiteAdmin @Settings @smoketest
  Scenario: Add Logo
    Given I click on "Logos" in left panel of settings tab
    When I attach a logo
    Then I should see my uploaded file in the upper right corner of my project

  @SiteAdmin @Settings
  Scenario: Remove Logo 35491
    Given I click on "Logos" in left panel of settings tab
    When I click on remove in logo
    Then I should see custom logo removed in the upper right corner of my project

  @SiteAdmin @Settings
  Scenario: Preview Logo 35489
    Given I click on "Logos" in left panel of settings tab
    When I click on logo for preview
    Then I should see my uploaded file in the upper right corner of my project
    When I click on "Logos" in left panel of settings tab
    Then I should see custom logo removed in the upper right corner of my project

  @SiteAdmin @Settings
  Scenario: Delete Logo 35492
    Given I click on "Logos" in left panel of settings tab
    When I click on Delete in logo
    And I click on Delete confirmation in popup
    Then I should not see any client logo under logosRequest

