Feature: Create Resources
	As a site user
	I want to create events
	
	Scenario: User create resource
		Given I am logged in
		When I create a new resource
		Then I should see a resource created message
		
	Scenario: User should not be able to create a resource without a house
		Given I am logged in
		When I try to create a new resource without a house
		Then I should see an error message