@smoke @regression
Feature: Create project
  As a MerrillPM
  I want to create a project
  So that clients can use the system

  Scenario: Create a project
    Given a user "asingh" exists
    And I go to the tracker new project window
    When I enter the new project with
      | project_name | sa_number | datasite_type | adjacency           | classification                  | company | investment_bank | law_firm | datasite_sales | inside_sales | lfts_sales | pm      | pm_location | pm_team | revenue_site | project_timezone | coi            | client_region                | credit_check_num | credit_cap | currency | warehouse_pricing |
      | capynew1         | 993989387 | Real Estate   | Contract Management | Contract Management/Procurement | Apple   |                 |          | msales         |              |            | anoopkumar.singh | LON         | London  | LON (London) | Europe/London    | United Kingdom | International,Central Europe | 5000             | 10000      | EUR      | true              |
    Then the project "capynew1" should exist
    And the project "capynew1" can launch