Feature: Email template functionality
  Able to create new Email template
  Able to Edit Email template
  Able to Delete Email template


  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Settings" tab
    And I go to the Settings tab

  @SiteAdmin @Settings
  Scenario: Create Email Template
    Given I click on "Templates" in left panel of settings tab
    And I click Add
    And I select Email from the Type dropdown
    And I click Next
    And Fill "Email Template" in label name
    And Fill "Template for Email" in Subject name
    And Fill Content
    And I click on Save
    Then "Email Template" should be in template

  @SiteAdmin @Settings
  Scenario: Edit Email template validation
    Given I click on "Templates" in left panel of settings tab
    When Click on link "Email Template"
    And I click on Edit button
    And Fill "Email Template 123" in Subject name
    And I click on Save
    Then have a text "Email Template 123"

  @SiteAdmin @Settings
  Scenario: Delete Email Template
    Given I click on "Templates" in left panel of settings tab
    When Click on link "Email Template"
    And Delete created email template
    And Accept browser popup
    Then Legalese should not see email in Template