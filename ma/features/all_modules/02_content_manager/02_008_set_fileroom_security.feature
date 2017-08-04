Feature: Change fileroom security
  In order to allow users to access content uniformly across a fileroom
  As a Site Admin
  I want to edit fileroom level security

  Scenario: Scenario: I am logging in the application and launching inside Hope page
    Given "Site Admin" is on Home Page
    And I click on "Content Manager" tab
    And I go to the Content Manager tab

  @SiteAdmin
  Scenario: Change fileroom security
    Given I click on first Fileroom in Left Panel
    And I click Edit (content frame)
    And I set all roles to Print
    And I click Save (content frame)
    Then I should see my fileroom summary with View and Print shaded
    And I Auto Approve the Open session created above
  
