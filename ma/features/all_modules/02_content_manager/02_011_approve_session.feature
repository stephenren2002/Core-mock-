Feature: Approve a Session
  In order to publish changes to a project
  As a Merrill User
  I want to Approve my Needs Approval session

  Scenario: Scenario: I am logging in the application and launching inside Hope page
    Given "Site Admin" is on Home Page
    And I click on "Content Manager" tab
    And I go to the Content Manager tab

  @SiteAdmin
  Scenario: Approve Session
    #Given I click Session Locks in the left pane
    Then I should see the Session Locks page and my session is not listed
    And I click on my Needs Approval session
    And I click Approve
    And I jump to Content Manager from Session Locks Tab

  
