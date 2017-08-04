@SiteAdmin
Feature: Add Logo
  In order to personalize my project with a logo
  As a Site Admin
  I want to add and apply a new logo

  Scenario: Add Logo
  	Given I am logged into a project
  	When I go to the Settings tab
  	And I attach a logo
  	Then I should see my uploaded file in the upper right corner of my project



  
