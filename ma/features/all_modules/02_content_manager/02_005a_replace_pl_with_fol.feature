Feature: Replace placeholder with Folder
  In order to update a placeholder with a Folder
  As a Site Admin
  I want to replace placeholder with a Folder

  Scenario: Scenario: I am logging in the application and launching inside Hope page
    Given "Site Admin" is on Home Page
    And I click on "Content Manager" tab
    And I go to the Content Manager tab

  @SiteAdmin
  Scenario: Replace placeholder with Folder by Right Click
    Given I click on Fileroom1 in Left Panel
    And I replace a placeholder with Folder by right click
    And I click Session Locks in the left pane
    And I click on my Open session
    Then I should see my placeholder with the Replace Folder type listed
    And I click Submit & Auto-Approve
    And I should return to the Session Locks screen and see no sessions
    And I jump to Content Manager from Session Locks Tab

  @SiteAdmin
  Scenario: Replace placeholder with Folder by Green Bar
    Given I click on Fileroom1 in Left Panel
    And I replace a placeholder with Folder by action
    And I click Session Locks in the left pane
    And I click on my Open session
    Then I should see my placeholder with the Replace Folder type listed
    And I click Submit & Auto-Approve
    And I should return to the Session Locks screen and see no sessions
    And I jump to Content Manager from Session Locks Tab


  @SiteAdmin
  Scenario: Replace placeholder with Folder by Hamburger icon
    Given I click on Fileroom1 in Left Panel
    And I replace a placeholder with Folder by hamburger
    And I click Session Locks in the left pane
    And I click on my Open session
    Then I should see my placeholder with the Replace Folder type listed
    And I click Submit & Auto-Approve
    And I should return to the Session Locks screen and see no sessions
    And I jump to Content Manager from Session Locks Tab
