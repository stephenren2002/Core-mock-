@SiteAdmin
Feature: Watermark a role
  In order to better protect my documents
  As a Site Admin
  I want to add a watermark to a role

  Scenario: Watermark a role
  	Given I am logged into a project
    When I go to the Users tab
    And I go to Roles via the left pane
    And I select a role
    And I select Edit Watermarks
    And I add Username as a diagonal watermark
    And I click Save (content frame)
  	Then I should see the role's summary page with watermark enabled

  
