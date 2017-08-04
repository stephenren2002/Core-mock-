Feature: Create fileroom
	As a user with access to Content Manager
	I want to add a new fileroom
	So I can organize my documents

	Scenario: I am logging in
		Given "Site Admin" is on Home Page
		And I click on "Content Manager" tab

	@SiteAdmin @ContentManager @smoketest
	Scenario: Add new fileroom
		Given I go to the Content Manager tab
		When I click the Add dropdown
		When I click Add Fileroom button
		When I enter a name in the textbox
		When I click Save (content frame)
		And I should see my new fileroom's details page
		Then The fileroom should be on the left pane navigation tree

 	@SiteAdmin @ContentManager
	Scenario: Add new fileroom from right click on left pane (TCID: 69088)
#		Given I go to the Content Manager tab
		When I choose add fileroom by right click from left pane
		When I enter a fileroom6 in the title box
		When I click Save (content frame)
		And I should see my new fileroom's details page
		Then I should see the fileroom6 in left pane navigation tree

	@SiteAdmin @ContentManager
	Scenario: Edit fileroom from right click on left pane (TCID: 69113)
#		And I click on "Content Manager" tab
#		Given I go to the Content Manager tab
		When I select edit from right click of fileroom6 from left pane
		And I enter edited name for fileroom
		When I click Save (content frame)
		And I should see my new fileroom's details page
		Then I should see the editedfileroom6 in left pane navigation tree
		And I Auto Approve the Open session created above

	@SiteAdmin @ContentManager
	Scenario: Edit fileroom from right click on right pane (TCID: 69114)
#		Given I go to the Content Manager tab
		When I select edit from right click of fileroom6 from right pane
		And I enter right pane right click edited name for fileroom
		When I click Save (content frame)
		And I should see my new fileroom's details page
		Then I should see the editedfileroom6 right click right pane edited in left pane navigation tree
		And I Auto Approve the Open session created above

	@SiteAdmin @ContentManager
	Scenario: Edit fileroom from action on right pane (TCID: 69115)
#		Given I go to the Content Manager tab
		When I select edit for fileroom6 from action from right pane
		And I enter right pane action edited name for fileroom
		When I click Save (content frame)
		And I should see my new fileroom's details page
		Then I should see the editedfileroom6 through action edited name in left pane navigation tree
		And I Auto Approve the Open session created above

	@SiteAdmin @ContentManager
	Scenario: Edit fileroom from action on right pane (TCID: 69116)
#		Given I go to the Content Manager tab
		When I select edit for fileroom6 from greenbar from right pane
		And I enter right pane green bar edited name for fileroom
		When I click Save (content frame)
		And I should see my new fileroom's details page
		Then I should see the editedfileroom6 through green bar edited name in left pane navigation tree
		And I Auto Approve the Open session created above