Feature: Series page

	Scenario: ver detalhes da serie
		Given there is a serie with the following info:
			| name 			| How i met your mother	|
			| country		| US					|
			| start_date	| 2011-08-15			|
			| runtime		| 60					|
			| status		| ended					|
			| image_url		| a						|
		When I am on the series "How i met your mother" page
		Then this serie's information should be visible
