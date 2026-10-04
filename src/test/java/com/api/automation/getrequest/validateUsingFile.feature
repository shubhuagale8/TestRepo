Feature: To validate the GET End POint
	To validate the get end point response
	

Background: Setup the Base path
	Given url 'http://localhost:9897'

	
Scenario: To get all the application in JSON format and validate using file
	Given path '/normal/webapi/all'
	And header Accept = 'application/json'
	When method get
	Then status 200
	* def actualResponse = read("../JsonResponse.json")
	And match response == actualResponse
	