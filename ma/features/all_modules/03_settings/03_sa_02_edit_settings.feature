Feature: Edit Settings
  In order to track my project settings
  As a Site Admin
  I want to edit my project settings

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Settings" tab
    #And I go to the Settings tab

  @SiteAdmin @Settings @smoketest
  Scenario: Edit Project Settings

    #Given I click on " Edit" in left panel of settings tab
    Given I click Edit
    And I select email alerts from the Type dropdown
    And I select other option in the email branding Language dropdown
    And I type the content for the branding
    And I change the disclaimer frequency from the dropdown
    #And I change the timezone of the project
    And I select "CHI (Chicago)" in the Time Zone dropdown
    And I click Save
    #And I should see the Time Zone display as "America/Chicago"
    And I should see a changes made in the settings tab