Feature: Create Resources
	As a site user
	I want to create events
	
	Scenario: User create resource
		Given I am logged in
		When I create a new resource
		Then I should see a resource created message