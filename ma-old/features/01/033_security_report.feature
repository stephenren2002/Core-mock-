@SiteAdmin
Feature: Run security report
  In order to review my project's security settings
  As a Site Admin
  I want to run a security report

  Scenario: Run security report
  	Given I am logged into a project
  	When I go to the Content Manager tab
  	And I click Reports
  	And I click Security Report
  	Then I should see the Security Report popup window

  
