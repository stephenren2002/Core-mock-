Feature: Email template functionality
  Able to create new Email template
  Able to Edit Email template
  Able to Delete Email template


  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Settings" tab
    And I go to the Settings tab

  @SiteAdmin @Settings @smoketest
  Scenario: Create Email validation 35591
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
  Scenario: Preview Email template validation 35594
    Given I click on "Templates" in left panel of settings tab
    When Click on link in Email Template
    And Read existing content
    And I click on "Preview"
    And Read existing content in preivew
    Then Preview content should match with existing content

  @SiteAdmin @Settings
  Scenario: Edit Email template validation 35592
    Given I click on "Templates" in left panel of settings tab
    When Click on link in Email Template
    And I click on Edit button
    And Fill "Email Template 123" in Subject name
    And I edit the content in template
    And I click on Save
    When Click on link in Email Template
    Then Have a text "Email Template 123" in subject
    Then Content should have edited text

  @SiteAdmin @Settings
  Scenario: Copy Email template validation 35593
    Given I click on "Templates" in left panel of settings tab
    When Click on link in Email Template
    And I click on Copy option
    And I click on Save button for copy email
    Then Copied email should be in template

  @SiteAdmin @Settings
  Scenario: Delete email template validation 35596
    Given I click on "Templates" in left panel of settings tab
    When Click on link in Email Template
    And Delete created email template
    And Accept browser popup
    Then Email should not be in Template

 # @SiteAdmin @Settings
  #Scenario: validate History of Email template
   # Given I click on "Templates" in left panel of settings tab
    #When Click on link "Email Template"
    #And I click on "History"
    #Then have a user history



