Feature: Copy document from one fileroom to another
  In order to Copy document from one fileroom to another
  As a Site Admin
  I want to copy a document

  Scenario: Scenario: I am logging in the application and launching inside Hope page
    Given "Site Admin" is on Home Page
    And I click on "Content Manager" tab
    And I go to the Content Manager tab

  @SiteAdmin
  Scenario: copy document folder and placeholder
    Given I click on Fileroom1 in Left Panel
    And I checked on all select check box
    And I click on copy button
    #And I go to the Content Manager tab
    And I choose destination fileroom
    And I click on Save button
    Then I should see my fileroom summary with copied folder listed
    Then I should see my fileroom summary with copied document listed
    Then I should see my fileroom summary with copied placeholder listed
    Then I Auto Approve the Open session created above