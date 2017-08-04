@MerrillUser
Feature: Add project note in Tracker
  In order to convey important project information
  As a Merrill user
  I want add a note to a project's Tracker page

  Scenario: Add project note
  	Given I am on "DS Demo DSv6 Automation zZz" Tracker page
  	When I click Add Note and see the new popup
  	And I check the critical checkbox
  	And I enter "Critical Note!" as the Subject
  	And I check the Project Management category
  	And I select "Tahoma" in the Font family dropdown
  	And I select "18 pt" in the Font size dropdown
  	And I click the italics button
  	And I add the text "This is a very important project note!" to the text box
  	And I click Submit (tracker)
  	Then I should see the new note on the Tracker page
