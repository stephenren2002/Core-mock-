Feature: I am selecting the particular project which i need to launch and work.

   @SiteAdmin @Users @Settings @UG-QAForum @SA-QAForum @SAIndex @UG-Full @UG-QAEdit @Place
   Scenario:
#      Given "Site Admin" is on Home Page
      Given I am in Global Dashboard
      And I select the Project
      And I accept Terms and Disclaimer
      Then I should be launched inside the project


   Scenario: Navigating to Index Tab
      Given I click on "Index" tab

   @QAForum #@UG-QAForum @SA-QAForum
   Scenario: Navigating to Q&A Forum Tab
      Given I click on "Q&A Forum" tab

   @Content
   Scenario: Navigating to Content Manager Tab
      Given I click on "Content Manager" tab

   @Users
   Scenario: Navigating to Users  Tab
      Given I click on "Users" tab

   @Reports
   Scenario: Navigating to Reports Tab
      Given I click on "Reports" tab

   @Settings
   Scenario: Navigating to Settings Tab
      Given I click on "Settings" tab