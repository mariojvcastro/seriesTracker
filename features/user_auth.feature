Feature: User Authorization
	In order to
	


	Scenario: Login
		Given I am on the homepage
		And there is a user "pedro" with password "123"
		When I fill in the following:
			| name		| pedro		|
			| password	| 123		|
		And I press "Login"
		Then I should see "pedro"


	Scenario: Logout
		Given a user logged with username "pedro" and password "123"
		And I am on the homepage
		And I follow "Logout"
		Then I should see "Password"
