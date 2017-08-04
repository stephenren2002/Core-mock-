Feature: Copy content from one fileroom to another
  In order to Copy document from one fileroom to another
  As a Site Admin
  I want to copy a document

  Scenario: I am logging in the application and launching inside Hope page
    Given "Site Admin" is on Home Page
    And I click on "Content Manager" tab
    And I go to the Content Manager tab

 @SiteAdmin
  Scenario: Copy document by right click
    Given I click on Fileroom1 in Left Panel
    When I select document by "right click"
    And I choose destination fileroom to copy
    And I click on Save button
    Then I Auto Approve the Open session created above
    And I click on Fileroom3 in left pane
    Then I should see my copied document by "right click" in the fileroom


  @SiteAdmin
  Scenario: Copy document by action
    Given I click on Fileroom1 in Left Panel
    When I select document by "action"
    And I choose destination fileroom to copy
    And I click on Save button
    Then I Auto Approve the Open session created above
    And I click on Fileroom3 in left pane
    Then I should see my copied document by "action" in the fileroom

  @SiteAdmin
  Scenario: Copy document by black bar
    Given I click on Fileroom1 in Left Panel
    When I select document by "black bar"
    And I click on copy button
    And I choose destination fileroom to copy
    And I click on Save button
    Then I Auto Approve the Open session created above
    And I click on Fileroom3 in left pane
    Then I should see my copied document by "black bar" in the fileroom

  @SiteAdmin
  Scenario: Copy folder by right click
    Given I click on Fileroom1 in Left Panel
    When I select folder by "right click"
    And I choose destination fileroom to copy
    And I click on Save button
    Then I Auto Approve the Open session created above
    And I click on Fileroom3 in left pane
    Then I should see my copied folder by "right click" in the fileroom

  @SiteAdmin
  Scenario: Copy folder by action
    Given I click on Fileroom1 in Left Panel
    When I select folder by "action"
    And I choose destination fileroom to copy
    And I click on Save button
    Then I Auto Approve the Open session created above
    And I click on Fileroom3 in left pane
    Then I should see my copied folder by "action" in the fileroom

  @SiteAdmin
  Scenario: Copy folder by black bar
    Given I click on Fileroom1 in Left Panel
    When I select folder by "black bar"
    And I click on copy button
    And I choose destination fileroom to copy
    And I click on Save button
    Then I Auto Approve the Open session created above
    And I click on Fileroom3 in left pane
    Then I should see my copied folder by "black bar" in the fileroom

  @SiteAdmin
  Scenario: Copy placeholder by right click
    Given I click on Fileroom1 in Left Panel
    When I select placeholder by "right click"
    And I choose destination fileroom to copy
    And I click on Save button
    Then I Auto Approve the Open session created above
    And I click on Fileroom3 in left pane
    Then I should see my copied placeholder by "right click" in the fileroom

  @SiteAdmin
  Scenario: Copy placeholder by action
    Given I click on Fileroom1 in Left Panel
    When I select placeholder by "action"
    And I choose destination fileroom to copy
    And I click on Save button
    Then I Auto Approve the Open session created above
    And I click on Fileroom3 in left pane
    Then I should see my copied placeholder by "action" in the fileroom

  @SiteAdmin
  Scenario: Copy placeholder by black bar
    Given I click on Fileroom1 in Left Panel
    When I select placeholder by "black bar"
    And I click on copy button
    And I choose destination fileroom to copy
    And I click on Save button
    Then I Auto Approve the Open session created above
    And I click on Fileroom3 in left pane
    Then I should see my copied placeholder by "black bar" in the fileroom

