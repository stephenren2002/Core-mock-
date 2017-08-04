Feature: Delete document
  In order to remove a document that is not needed from my project
  As a Site Admin
  I want to delete a document

  Scenario: Scenario: I am logging in the application and launching inside Hope page
    Given "Site Admin" is on Home Page
    And I click on "Content Manager" tab
    And I go to the Content Manager tab

  @SiteAdmin
  Scenario: Delete a document
    Given I click on Fileroom1 in Left Panel
    And I click on Folder1 in content frame
    And I click on a document
    And I click on Actions
    And I click on Delete
    Then I should see the document marked for deletion in the fileroom summary
    Then I Auto Approve the Open session created above

  
