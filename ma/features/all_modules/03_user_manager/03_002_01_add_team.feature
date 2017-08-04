Feature: Add Team
  In order to create a new reporting group
  As a Site Admin
  I want to create a new Team

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users
  Scenario: Add Team
    Given Select "Teams" from the left pane
    And I click Add Team
    And I enter a team label
    And I click Save (content frame)
    Then I should see the new team's detail page

  
