@SiteAdmin
Feature: Enable Q&A forum for Admin
  In order to Site Admins to gain access to the Q&A forum
  As a Site Admin
  I want to set up the Site Admin role with Q&A Forum

  Scenario: Enable Q&A forum for Admin
  	Given I am logged into a project
  	When I go to the Users tab
  	And I enable Q&A Forum access for the Site Admin role
  	Then I should see the Q&A Forum enabled for the role

  
