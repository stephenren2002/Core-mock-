Feature: Add Community
  In order to create another Q&A forum group
  As a Site Admin
  I want to create a new community

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users @smoketest
  Scenario: Add Community
    And Select "Communities" from the left pane
    And I click Add Community
    And I enter a Community label
    And I click Save (content frame)
    And I edit the community to be submit enabled
    Then I should see the new community's detail page


  @SiteAdmin @Users
  Scenario: Validate error message for duplicate team (TCID: 35576)
   Given Select "Communities" from the left pane
    When I read existing community name
    And I click Add Community
    And I enter a existing community label
    And I click Save (content frame)
    Then I should see error message for duplicate community

  @SiteAdmin @Users
  Scenario: Validate error message for empty team
    Given Select "Communities" from the left pane
    When I click Add Community
    And I click Save (content frame)
    Then I should see error message for empty community