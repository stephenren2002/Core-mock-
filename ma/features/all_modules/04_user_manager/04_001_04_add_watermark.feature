Feature: Watermark a role
  In order to better protect my documents
  As a Site Admin
  I want to add a watermark to a role

  Scenario: Scenario: I am logging in the application and launching inside Hope page
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users
  Scenario: Watermark a role
    Given Select "Roles" from the left pane
    And I select default "Site Admin" role
    And I select Edit Watermarks
    And I add Username as a diagonal watermark
    And I click Save (content frame)
  	Then I should see the role's summary page with watermark enabled

  
