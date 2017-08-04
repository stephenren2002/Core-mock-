Feature: Edit Preferences
  In order to change my project alert preferences
  As a Site Admin
  I want to edit my New Document Alert frequency

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Settings" tab
    And I go to the Settings tab

  @wip
  Scenario: Edit Preferences
    Given I click on Preferences
    And I click Edit (preferences)
    And I select Weekly for New Documents Uploaded alerts
    And I click Save (preferences)
    Then I should see my Preferences summary with New Document alerts set to Weekly

  
