Feature: Create House
	As a site user
	I want to create houses
	
	Scenario: User create event
		Given I am logged in
		When I create a new house
		Then I should see an house created message
	