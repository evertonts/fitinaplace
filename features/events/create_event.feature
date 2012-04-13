Feature: Create Event
	As a site user
	I want to create events
	
	Scenario: User create event
		Given I am logged in
		When I create a new event
		Then I should see an event created message

