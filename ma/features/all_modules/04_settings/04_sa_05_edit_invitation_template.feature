Feature: Edit invitation template
  In order to send my users a customized invitation
  As a Site Admin
  I want to create an invitation template

  Scenario: I am logging in
    Given "Site Admin" is on Home Page
    And I click on "Settings" tab
    And I go to the Settings tab

  @SiteAdmin @Settings
  Scenario: Edit invitation template

    Given I click on "Templates" in left panel of settings tab
    And I select Invitation from the Type filter
    And click on the invitation link present
    And click on Edit
    And I enter "This is a edited text in label" in the Label field
    And click on Save
    Then I should see the edited text in the invitation




