Feature: Add a placeholder
  In order to better organize my content
  As a Site Admin
  I want to add a new placeholder


  Scenario: Scenario: I am logging in the application and launching inside Hope page
    Given "Site Admin" is on Home Page
    And I click on "Content Manager" tab
    And I go to the Content Manager tab

  @SiteAdmin
  Scenario: Add a placeholder
    Given I click on Fileroom1 in Left Panel
    And I add multiple placeholder
    And I click Save (content frame)
    Then I should see my fileroom summary with newly created placeholder listed
    And I Auto Approve the Open session created above
  
