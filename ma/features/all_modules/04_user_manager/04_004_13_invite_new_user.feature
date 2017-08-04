Feature: Invite New User
  In order to give access to a new user
  As a Site Admin
  I want to send a user invitation

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users
  Scenario: Invite New User
    Given Select "Users" from the left pane
    And I click Add User
    And I invite a new site admin type user
    Then I should see confirmation that the invitation was sent
#
  @SiteAdmin @Users
  Scenario: Custom invitation template validating
    Given Select "Users" from the left pane
    And I select the new user
    And I access the user's invitation email
    Then I should see a preview of the invitation I created in Settings

  @SiteAdmin @Users
  Scenario: Register new user & Contact Information validation
    When I click on save without enter any data
    Then I should see error as "Password must have a minimum of 8 characters"
    When I enter "email" with no character in the field
    Then I should see validation in "email" field error as "Required"
    When I enter email with no@ character in the field
    Then I should see validation in "email" field error as "The Value in this field is invalid."
    When I enter email with emailaddress character in the field
    Then I should not see any error in the "email" field
    When I enter "firstName" with no character in the field
    Then I should see validation in "firstName" field error as "Required"
    When I enter "firstName" with exceed limit 31 characters in the field
    Then I should see validation in "firstName" field error as "The Value in this field is invalid."
    When I enter "firstName" with = in the initial in the field
    Then I should see validation in "firstName" field error as "This field cannot begin with an '='"
    When I enter "firstName" with exact limit 30 characters in the field
    Then I should not see any error in the "firstName" field
    When I enter "lastName" with no character in the field
    Then I should see validation in "lastName" field error as "Required"
    When I enter "lastName" with exceed limit 31 characters in the field
    Then I should see validation in "lastName" field error as "The Value in this field is invalid."
    When I enter "lastName" with = in the initial in the field
    Then I should see validation in "lastName" field error as "This field cannot begin with an '='"
    When I enter "lastName" with exact limit 30 characters in the field
    Then I should not see any error in the "lastName" field
    When I enter "phone" with no character in the field
    Then I should see validation in "phone" field error as "Required"
    When I enter less than 3 characters in the phone field
    Then I should see validation in "phone" field error as "The Value in this field is invalid."
    When I enter "phone" with exceed limit 51 characters in the field
    Then I should see validation in "phone" field error as "The Value in this field is invalid."
    When I enter "phone" with exact limit 50 characters in the field
    Then I should not see any error in the "phone" field
    When I enter "phoneExt" with no character in the field
    When I enter "phoneExt" with exceed limit 21 characters in the field
    Then I should see validation in "phoneExt" field error as "The Value in this field is invalid."
    When I enter "phoneExt" with exact limit 20 characters in the field
    Then I should not see any error in the "phoneExt" field


  @SiteAdmin @Users
  Scenario: Register new user & Company Information validation
    When I enter "companyName" with no character in the field
    Then I should see validation in "companyName" field error as "Required"
    When I enter "companyName" with exceed limit 71 characters in the field
    Then I should see validation in "companyName" field error as "The Value in this field is invalid."
    When I enter "companyName" with = in the initial in the field
    Then I should see validation in "companyName" field error as "This field cannot begin with an '='"
    When I enter "companyName" with exact limit 70 characters in the field
    Then I should not see any error in the "companyName" field
    When I select no "orgType" from the dropdown
    Then I should see validation in "orgType" field error as "Required"
    When I select for "orgType" from the dropdown
    Then I should not see any error in the "orgType" field
    When I select no "jobFunction" from the dropdown
    Then I should see validation in "jobFunction" field error as "Required"
    When I select for "jobFunction" from the dropdown
    Then I should not see any error in the "jobFunction" field
    When I enter "address1" with no character in the field
    Then I should see validation in "address1" field error as "Required"
    When I enter "address1" with exceed limit 101 characters in the field
    Then I should see validation in "address1" field error as "The Value in this field is invalid."
    When I enter "address1" with exact limit 100 characters in the field
    Then I should not see any error in the "address1" field
    When I enter "city" with no character in the field
    Then I should see validation in "city" field error as "Required"
    When I enter "city" with exceed limit 51 characters in the field
    Then I should see validation in "city" field error as "The Value in this field is invalid."
    When I enter "city" with exact limit 50 characters in the field
    Then I should not see any error in the "city" field
    When I enter "state" with no character in the field
    When I enter "state" with exceed limit 51 characters in the field
    Then I should see validation in "state" field error as "The Value in this field is invalid."
    When I enter "state" with exact limit 50 characters in the field
    Then I should not see any error in the "state" field
    When I enter "zipcode" with no character in the field
    Then I should see validation in "zipcode" field error as "Required"
    When I enter "zipcode" with exceed limit 21 characters in the field
    Then I should see validation in "zipcode" field error as "The Value in this field is invalid."
    When I enter "zipcode" with exact limit 20 characters in the field
    Then I should not see any error in the "zipcode" field
    When I select no "country" from the dropdown
    Then I should see validation in "country" field error as "Required"
    When I select for "country" from the dropdown
    Then I should not see any error in the "country" field


  @SiteAdmin @Users
  Scenario: Register new user & Password Information validation
    When I enter "no" characters in the "password" field
    Then I should see error as "Password must have a minimum of 8 characters"
    When I enter "lessthan8" characters in the "password" field
    Then I should see error as "Password must have a minimum of 8 characters"
    When I enter "firstname" characters in the "password" field
    When I enter "firstname" characters in the "confirmPassword" field
    Then I should see error as "Password cannot contain your first or last name, company name, login name, or e-mail address or the word "password""
    When I enter "lastname" characters in the "password" field
    When I enter "lastname" characters in the "confirmPassword" field
    Then I should see error as "Password cannot contain your first or last name, company name, login name, or e-mail address or the word "password""
    When I enter "companyname" characters in the "password" field
    When I enter "companyname" characters in the "confirmPassword" field
    Then I should see error as "Password cannot contain your first or last name, company name, login name, or e-mail address or the word "password""
    When I enter "email" characters in the "password" field
    When I enter "email" characters in the "confirmPassword" field
    Then I should see error as "Password cannot contain your first or last name, company name, login name, or e-mail address or the word "password""
    When I enter "direct" characters in the "password" field
    When I enter "direct" characters in the "confirmPassword" field
    Then I should see error as "Password cannot contain your first or last name, company name, login name, or e-mail address or the word "password""
    When I enter correct "password" in the field
    When I enter wrong password in the field
    Then I should see error as "New password and confirm password do not match"
    When I enter correct "confirmPassword" in the field


  @SiteAdmin @Users
  Scenario: Register new user & Security Information validation
    When I select no "challengeId" from the dropdown
    Then I should see validation in "challengeId" field error as "Required"
    When I select for "challengeId" from the dropdown
    Then I should not see any error in the "challengeId" field
    When I enter "challengeResponse" with no character in the field
    Then I should see validation in "challengeResponse" field error as "Required"
    When I enter "challengeResponse" with exceed limit 101 characters in the field
    Then I should see validation in "challengeResponse" field error as "The Value in this field is invalid."
    When I enter "challengeResponse" with exact limit 100 characters in the field
    Then I should not see any error in the "challengeResponse" field
    When I click on save with "wrong" email address
    Then I should see error as "E-Mail entered does not match e-mail associated with this Invitation"
    When I click on save with "right" email address
    When I enter correct "password" in the field
    When I enter correct "confirmPassword" in the field
    When I click on save button in the registration page
    Then I should see "new" user in an Enabled status



