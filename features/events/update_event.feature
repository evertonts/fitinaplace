Feature: Update Event
	As a site user
	I want to edit my events
	
	Scenario: User updates his event
		Given I am logged in
		When I create a new event
		And I edit this event
		Then I should see an event updated message
		
	Scenario: User can't update other's person event
		Given I am logged in
		When I try to edit other person's event
		Then I should see an access denied message
		