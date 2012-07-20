Feature: Create Event
	As a site user
	I want to create offerings
	
	Scenario: User create offering
		Given I am logged in
		When I create a new event
		Then I create a new offering for this event
		And I should see an offering created message