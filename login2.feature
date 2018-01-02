Feature: login to application
As a regular user I want to be able to authenticate to the application
So that I can see my account details

Rules:
	- User must be registered
	- Authenticate form contains two fields: login and password
	- Login must be an e-mail address and must consist up to 60 characters
	

Scenario: successful login
	Given I am on a login page
	When I fill "login" with <login>
	And I fill "password" with <password>
	And click "Login" button
	Then I am redirect to page with my profile
	And I can see my account details - name, surname, e-mail address, mailing address

Examples:
	| login								| password 		|
	| kamilaprzywara@gmail.com					| Winter		|
	| luiza.kwadrys@intive.com					| Summer		|
	| robert.hospodarysko@intive.com				| Cucum8er		|
	| pansylwester.brzeczyszczykiewicz12071980123456789@gmail.com	| Miki123		|
	| panimarzenka.brzeczyszczykiewicz120719801234567890@gmail.com	| House1207		|
	
	
Scenario: unregistered user
	Given I am on a login page
	When I fill "login" with <login>
	And I fill "password" with <password>
	And click "Login" button
	Then I am be informed about unsuccessful login by communication "Authentication failed. Login or password are incorrect."
	And I am redirected to login page
	
Examples:
	| login								| password		|
	| czelengerka7@gmail.com					| patr0nage		|
	| kamila.wrzesien@intive.com					| September7		|
	
	

Scenario Outline: unsuccessful login to the application due to incorrect data
	Given I am on a login page
	When I fill "login" with <login>
	And I fill "password" with <password>
	And click "Login" button
	Then I am be informed about unsuccessful login by communication "Authentication failed. Login or password are incorrect."
	And I am redirected to login page
	
Examples:
	| login								| password 		|
	| kamilaprzywar@gmail.com					| Winter		|
	| luiza.kwadrys							| Summer		|
	| robert.hospodarysko@intive.com				| Cucumber		|	
	| kamilaprzywar@gmail.com					| Einter		|		
	| kamilaprzywara@gmail						|			|	
	|								| Winter		|
	| k 								| Winter		|
	| ka								| Winter
	| tobatrlomiej.brzeczyszczykiewicz1207198012345678901@gmail.com | 1234			|
	
