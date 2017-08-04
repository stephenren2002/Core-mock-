Feature: Login field validation scenarios
  This feature will validate all the login scenarios with differenct combinations of username/password.

  @UG-Full
  Scenario Outline: Checking the validation functions for Login
    Given I am in Datasite Login Page
    When I enter "username" as "<username>"
    When I enter "password" as "<pwd>"
    And I press the "Submit" button
    Then  I should see this message "<err_msg>"

    Examples:
      |username|pwd|err_msg|
      |             |                 |Invalid Credentials|
      |             ||Invalid Credentials|
      ||         |Invalid Credentials|
      |||Invalid Credentials|
      |dsv6.automation+user@gmail.com||Invalid Credentials|
      ||DataSite4|Invalid Credentials|
      |bkrmrll@gmail.com|DataSite4|Invalid Credentials|
      |dsv6.automation+user@gmail.com|Wednesday@123|Invalid Credentials|




