Feature: To validate the GET End POint
	To validate the get end point response
	

Background: Setup the Base path
	Given url 'http://localhost:9897'

	
Scenario: To get all the application in XML format
	Given path '/normal/webapi/all'
	And header Accept = 'application/xml'
	When method get
	Then status 200
	And match response/List/item/jobId == '1'
	And match response/List/item/jobTitle == 'Software Engg'
	And match response/List/item/experience/experience[1] == 'Google'
	And match response/List/item/project/project/projectName == 'Movie App' 
	And match response/List/item/project/project/technology/technology[2] == 'SQL Lite'
	And match /List/item/jobId == '1'
	# traverse as JSON
	And match response.List.item.experience.experience[0] == 'Google'
	
Scenario: To get all the application in XML format and validate it with fuzzy matcher 
	Given path '/normal/webapi/all'
	And header Accept = 'application/xml'
	When method get
	Then status 200
	And match response/List/item/jobId == '#notnull'
	And match response/List/item/jobTitle == '#string'
	And match response/List/item/project/project/projectName == '#present' 
	And match response/List/item/project/project/technology/technology[2] == '#ignore'