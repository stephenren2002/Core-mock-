@SiteAdmin
Feature: Turn on email alert details
  In order to include a detailed summary of new documents added to reviewers
  As a Site Admin
  I want to enable detailed alerts

  Scenario: Enable details in new document alerts
  	Given I am logged into a project
  	When I go to the Settings tab
  	And I click on Project Administration
  	And I click Edit
  	And in the Email Alerts dropdown I select Detailed Alerts
  	And I click Save
  	Then I should see the Email Alerts Details field as Yes

  
