
Feature: Reorder Index
	In order to change the order of folders and documents on my project
	As a Site Admin
	I want to reorder my index

	Scenario: Scenario: I am logging in the application and launching inside Hope page
		Given "Site Admin" is on Home Page
		And I click on "Content Manager" tab
		And I go to the Content Manager tab

	@SiteAdmin
	Scenario: Reorder Index
		Given I click on Fileroom1 in Left Panel
		#And I click Actions
		And I click Reorder Folder Contents
		And I move some items to new index locations
		And I click Submit
		Then I should see the fileroom summary page with items locked for edit
		And I Auto Approve the Open session created above

  
