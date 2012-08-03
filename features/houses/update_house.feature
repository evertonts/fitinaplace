Feature: Update House
	As a site user
	I want to edit my houses
	
	Scenario: User updates his house
		Given I am logged in
		When I create a new house
		And I edit this house
		Then I should see a house updated message
		
	Scenario: User can't update other's person house
		Given I am logged in
		When I try to edit other person's house
		Then I should see my home page