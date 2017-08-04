Feature: Register a User
  As a user
  I want to create an account
  So I can use DataSite CM

  Scenario: Register a Merrill User
    Given a user new user has been invited to tracker
    And the new user goes to the registration link in the email
    When I enter the new user registration information
    Then the new user should be registered