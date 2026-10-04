Feature: To test the get end point of the application

Background: Setup the Base path
Given url 'http://localhost:9897'
And print '----------Baground Keyword------------'


	
Scenario: To get all the application in JSON format
	#Given url 'https://jsonplaceholder.typicode.com/posts/1'
	Given path '/normal/webapi/all'
	When method get
	Then status 200
	
Scenario: To get all the application in JSON format using path variable
	#Given url 'https://jsonplaceholder.typicode.com'
	And path '/normal/webapi/all'
	And header Accept = 'Application/json'
	When method get
	Then status 200
		
Scenario: To get all the application in XML format using path variable
	#Given url 'https://jsonplaceholder.typicode.com'
	And path '/normal/webapi/all'
	And header Accept = 'Application/xml'
	When method get
	Then status 200