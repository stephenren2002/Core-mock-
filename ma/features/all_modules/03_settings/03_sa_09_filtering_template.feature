Feature: Filter functionality in template


  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Settings" tab
    And I go to the Settings tab

  @SiteAdmin @Settings
  Scenario: Filter on invitation template 35583
  Given I click on "Templates" in left panel of settings tab
    When I select "Invitation" from the Type filter
    And I should see only invitations

  @SiteAdmin @Settings
  Scenario: Filter on Email template
    Given I click on "Templates" in left panel of settings tab
    When I select "Email" from the Type filter
    And I should see only Emails

  @SiteAdmin @Settings
  Scenario: Filter on Legalese template
    Given I click on "Templates" in left panel of settings tab
    When I select "Legalese" from the Type filter
    And I should see only Legalese
