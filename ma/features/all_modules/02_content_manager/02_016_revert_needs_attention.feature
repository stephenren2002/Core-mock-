Feature: Revert needs attention
  In order to verify the html uploader
  through SA with in content and folder

  Scenario: Scenario: I am logging in the application and launching inside Home page
    Given "Site Admin" is on Home Page
    And I click on "Content Manager" tab
    And I go to the Content Manager tab

  @SiteAdmin
  Scenario: Reverting the needs attention session
    Given I click on Fileroom1 in Left Panel
    And I click on Folder1 in content frame
    And I click the Add dropdown
    And I click Add Documents
    And I pick the special media document in HTML Uploader
    And I click on Upload My Queue in HTML Uploader
    And I click on Done Uploading Files button in HTML Uploader
    Given I click Session Locks in the left pane
    And I click on my Open session
    And I click Submit
    When I click on Revert Needs Attention
    And I should return to the Session Locks screen and see no sessions
    And I jump to Content Manager from Session Locks Tab
