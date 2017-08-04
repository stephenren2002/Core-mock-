Feature: Register User
  In order to provide access to a user
  As a Merrill User
  I want to register the user

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users @smoketest
  Scenario: Register existing User
    Given Select "Users" from the left pane
    And I select the user
    And I access the user's invitation email
    And I register the user
    Then I should see "existing" user in an Enabled status