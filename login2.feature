Feature: login to application
As a regular user I want to be able to authenticate to the application
So that I can see my account details

Rules:
	- User must be registered
	- Login must be an e-mail address
	- Password must be up to 60 characters
	
Background:
	Given I am registered user
	And my account is activated

Scenario Outline: successful login
	Given I am on a login page
	When I fill "login" with <login>
	And I fill "password" with <correct-password>
	And click "Login" button
	Then I am redirect to page with my profile
	And I can see my account details - name, surname, e-mail address, mailing address

Examples:
	| login		| correct-password 		|
	| a@a.com	| up to 60 characters	|
	| b@b.com	| up to 60 characters	|
	
	
Background:
	Given I am unregistered user
	And my account is inactivated
	
Scenario: unregistered user
	Given I am on a login page
	When I fill "login" with e-mail address
	And I fill "password"
	And click "Login" button
	Then I am be informed about unsuccessful login by communication "Authentication failed. Login or password are incorrect."
	And I am redirected to login page
	

Background:
	Given I am registered user
	And my account is activated
	
Scenario Outline: unsuccessful login to the application due to incorrect e-mail address
	Given I am on a login page
	When I fill "login" with <incorrect login>
	And I fill "password" with <correct-password>
	And click "Login" button
	Then I am be informed about unsuccessful login by communication "Authentication failed. Login or password are incorrect."
	And I am redirected to login page
	
Examples:
	| incorrect login		| correct-password 		|
	| aa					| up to 60 characters	|
	| bb					| up to 60 characters	|
	
	
Scenario Outline: unsuccessful login to the application due to incorrect password
	Given I am on a login page
	When I fill "login" with <login>
	And I fill "password" with <incorrect-password>
	And click "Login" button
	Then I am be informed about unsuccessful login by communication "Authentication failed. Login or password are incorrect."
	And I am redirected to login page
	
Examples:
	| login		| incorrect-password 	|
	| a@a.com	| over 60 characters	|
	| b@b.com	| over 60 characters	|