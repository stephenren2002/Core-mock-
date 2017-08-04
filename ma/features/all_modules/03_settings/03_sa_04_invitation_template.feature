Feature: Invitation template
  In order to send my users a customized invitation
  As a Site Admin
  I want to create an invitation template

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Settings" tab
    And I go to the Settings tab

  @SiteAdmin @Settings @smoketest
  Scenario: Create invitation template
    Given I click on "Templates" in left panel of settings tab
    And I click Add
    And I select Invitation from the Type dropdown
    And I select Russian from the Language dropdown
    And I click Next
    And I enter "Cust Eng invitation" in the Label field
    And I click the Bold button
    And I select Tahoma from the Font Family dropdown
    And I select 14pt from the Font Sizes dropdown
    And in the Content window I add the text "This is custom content added to a custom invitation template created via automation. Welcome to Project."
    And I center the text
    And I click Save
    And Click on link in invitation Template
    #And I click the link "Custom Russian invitation"
    Then I should see a preview of the invitation I created

  @SiteAdmin @Settings
  Scenario: Preview Invitation template validation
    Given I click on "Templates" in left panel of settings tab
    And I select Invitation from the Type filter
    And Click on link in invitation Template
    And read existing content of invitation
    And I click on "Preview"
    And read existing content in preivew of invitation
    Then preview content should match with existing content of invitation

  @SiteAdmin @Settings
  Scenario: Edit invitation template
    Given I click on "Templates" in left panel of settings tab
    And I select Invitation from the Type filter
    And Click on link in invitation Template
    And click on Edit
    And I enter "Edited Invitation to DataSite Project [projectname]" in the subject field
    And click on Save
    Then I should see the edited text in the invitation

  @SiteAdmin @Settings
  Scenario: Copy invitation template validation
    Given I click on "Templates" in left panel of settings tab
    And I select Invitation from the Type filter
    And Click on link in invitation Template
    And I click on Copy option
    And I click on Save button for copy invitation
    Then copied invitation should be in template

  @SiteAdmin @Settings
  Scenario: Delete invitation template
    Given I click on "Templates" in left panel of settings tab
    And I select Invitation from the Type filter
    And Click on link in invitation Template
    And click on Delete
    Then The invitaion should be deleted