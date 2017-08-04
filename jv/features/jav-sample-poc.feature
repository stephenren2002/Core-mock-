Feature: Login using front-end authentication

  Scenario: Login as a user
    Given I open the app
    Then I should be on the login page
    When I enter username "test@merrillcorp.com" and password "password"
    Then the project navigation bar should be present
    Then I click on the project navigation "Users" tab
    Then Users tab should be open
    Then I click on "First Name" in user's table
    Then users has "asc" order by "First Name"
    Then I click on "First Name" in user's table
    Then users has "desc" order by "First Name"
    Then I click on "Last Name" in user's table
    Then users has "asc" order by "Last Name"
    Then I click on "Last Name" in user's table
    Then users has "desc" order by "Last Name"
    Then I click on "Email" in user's table
    Then users has "asc" order by "Email"
    Then I click on "Email" in user's table
    Then users has "desc" order by "Email"
    Then I click on "Company" in user's table
    Then users has "asc" order by "Company"
    Then I click on "Company" in user's table
    Then users has "desc" order by "Company"