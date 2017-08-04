@SiteAdmin
Feature: Add Community
  In order to create another Q&A forum group
  As a Site Admin
  I want to create a new community

  Scenario: Add Community
  Given I am logged into a project
	When I go to the Users tab
	And I go to Communities via the left pane
	And I click Add Community
	And I enter a community label
	And I click Save (content frame)
  And I edit the community to be submit enabled
  Then I should see the new community's detail page

  
