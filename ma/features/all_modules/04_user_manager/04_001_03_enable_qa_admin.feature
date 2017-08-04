Feature: Enable Q&A forum for Admin
  In order to Site Admins to gain access to the Q&A forum
  As a Site Admin
  I want to set up the Site Admin role with Q&A Forum

  Scenario: Scenario: I am logging in the application and launching inside Hope page
    Given "Site Admin" is on Home Page
    And I click on "Users" tab
    And I go to the Users tab

  @SiteAdmin @Users @smoketest
  Scenario: Enable Q&A forum for Admin
    Given Select "Roles" from the left pane
    And I enable Q&A Forum access for the Site Admin role
    Then I should see the Q&A Forum enabled for the role

  
