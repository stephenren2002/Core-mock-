Feature: Navigating to User Tab

  @SiteAdmin @ContentManager @smoketest
  Scenario: I am navigating to User Tab
#    Given I click on "Users" tab
    Given I move to header Frame of the page

#  @smoketest
  Scenario: Logging out of browser
    Given I click Log Off
    When I click Yes to continue
    Then I should see the Sign Off Successful page