@User
Feature: Access New Documents
  In order to see a list of only documents added since my last login
  As a User
  I want to access New Documents

  Scenario: Access New Documents
  	Given I am logged into a project
  	When I go to the Index tab
  	And I click on the New Documents link
  	Then I should see a listing of documents added since my last login


  
