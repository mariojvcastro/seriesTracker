Feature: Series Calendar

	Scenario: Ver calendário na homepage
		When I am on the homepage
		Then I should see the weekdays
		

	Scenario: Ver episodio no calendario
		Given an episode of "How I met your mother" was released today
		When I am on the homepage
		Then I should see "How I met your mother"