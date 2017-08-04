Feature: Edit folder title
  In order to organize my project content
  As a Site Admin
  I want to change the title of an existing folder

  Scenario: Scenario: I am logging in the application and launching inside Hope page
    Given "Site Admin" is on Home Page
    And I click on "Content Manager" tab
    And I go to the Content Manager tab

@SiteAdmin
Scenario: Edit folder title
  Given I click on Fileroom1 in Left Panel
	And I edit the title of a folder
  	And I click Save (content frame)
	Then I should see my folder's details page
    And I Auto Approve the Open session created above
