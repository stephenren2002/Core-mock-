Feature: Run security report
	In order to review my project's security settings
	As a Site Admin
	I want to run a security report

	Scenario: Scenario: I am logging in the application and launching inside Hope page
		Given "Site Admin" is on Home Page
		And I click on "Content Manager" tab
		And I go to the Content Manager tab

	@SiteAdmin
	Scenario: Run security report
		Given I click on first Fileroom in Left Panel
		And I click Reports
		And I click Security Report
		Then I should see the Security Report popup window


