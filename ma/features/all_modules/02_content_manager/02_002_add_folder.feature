Feature: Add a folder
	In order to better organize my documents
	As a Site Admin
	I want to add a new folder

	Scenario: Scenario: I am logging in the application and launching inside Hope page
		Given "Site Admin" is on Home Page
		And I click on "Content Manager" tab
		Given I go to the Content Manager tab

	@SiteAdmin @smoketest
	Scenario: Add a folder
		Given I click on the fileroom1 in right panel
		And I click the Add dropdown
		And I click Add Folders
		And I enter text in the Name(s) text area
		When I click Save (content frame)
		Then I should see my fileroom summary with newly created folder listed
		And I Auto Approve the Open session created above
		And I jump to Content Manager from Session Locks Tab