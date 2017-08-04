@SiteAdmin
Feature: Change fileroom security
  In order to allow users to access content uniformly across a fileroom
  As a Site Admin
  I want to edit fileroom level security

  Scenario: Change fileroom security
  	Given I am logged into a project
  	When I go to the Content Manager tab
  	And I click on the fileroom
  	And I click Edit (content frame)
  	And I set all roles to Print
  	And I click Save (content frame)
  	Then I should see my fileroom summary with View and Print shaded

  
