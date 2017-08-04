Feature: Create invitation template
  In order to send my users a customized invitation
  As a Site Admin
  I want to create an invitation template

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Settings" tab
    And I go to the Settings tab

  @SiteAdmin @Settings
  Scenario: Create invitation template

    Given I click on "Templates" in left panel of settings tab
    And I click Add
    And I select Invitation from the Type dropdown
    And I select German from the Language dropdown
    And I click Next
    And I enter "Custom German invitation" in the Label field
    And I click the Bold button
    And I select Tahoma from the Font Family dropdown
    And I select 14pt from the Font Sizes dropdown
    And in the Content window I add the text "This is custom content added to a custom invitation template created via automation. Welcome to Project [projectname]."
    And I center the text
    And I click Save
    And I click the link "Custom German invitation"
    Then I should see a preview of the invitation I created