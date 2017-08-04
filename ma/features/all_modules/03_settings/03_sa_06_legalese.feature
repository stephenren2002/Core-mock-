Feature: Legalese functionality
  We wouldn't able to create any duplicate Legalese.
  There should be only one Legalese

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Settings" tab
    And I go to the Settings tab

	@SiteAdmin @Settings
  Scenario: validate duplicate legalese
    Given I click on "Templates" in left panel of settings tab
    And I click Add
    And I select Legalese from the Type dropdown
    And I click Next
    Then I should see alert message

	@SiteAdmin @Settings
  Scenario: Delete legalese validation
    Given I click on "Templates" in left panel of settings tab
    When Click on link "Conditions of Access"
    And Delete default legalese
    And Accept browser popup
    Then Legalese should not be in Template

	@SiteAdmin @Settings
  Scenario: Create legalese validation
    Given I click on "Templates" in left panel of settings tab
    And I click Add
    And I select Legalese from the Type dropdown
    And I click Next
    And Fill "Conditions of Access" in the label name
    And Fill "Conditions of Access" in Subject name
    And Fill Content
    And I click on Save
    Then "Conditions of Access" should be in the template

    @SiteAdmin @Settings
  Scenario: Preview legalese validation 35587
    Given I click on "Templates" in left panel of settings tab
    When Click on link "Conditions of Access"
    And Read existing content
    And I click on "Preview"
    And Read existing content in preivew
    Then Preview content should match with existing content
	
	@SiteAdmin @Settings
  Scenario: Edit legalese validation
    Given I click on "Templates" in left panel of settings tab
    When Click on link "Conditions of Access"
    And I click on Edit button
    And Fill "Conditions of Access 123" in Subject name
    And I click on Save
    Then Have a text "Conditions of Access 123" in subject
	 
	 @SiteAdmin @Settings
  Scenario: validate History of legalese
    Given I click on "Templates" in left panel of settings tab
    When Click on link "Conditions of Access"
    And I click on "History"
    Then Have a user history