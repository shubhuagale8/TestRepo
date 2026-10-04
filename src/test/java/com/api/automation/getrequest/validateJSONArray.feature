Feature: To validate the GET End POint
	To validate the get end point response
	

Background: Setup the Base path
	Given url 'http://localhost:9897'

	
Scenario: To get the data in JSON format
	Given path '/normal/webapi/all'
	And header Accept = 'application/json'
	When method get
	Then status 200
	And match response.[0].jobId == 1
	And match response.[0].experience[1] =='Apple'
	And match response.[0].project[0].projectName == 'Movie App'
	And match response.[0].project[0].technology[2] == 'Gradle'
	And match response.[0].experience == '#[3]'
	And match response.[0].project[0].technology == '#[3]'
	And match response.[0].experience[*] contains ["Mobile Iron","Apple"]
	And match response.[0].project[0].technology[*] == ["Kotlin","SQL Lite","Gradle"]
	And match response.[*].jobId contains 1
	
Scenario: To get the data in JSON format and validate using fuzzy matcher 
	Given path '/normal/webapi/all'
	And header Accept = 'application/json'
	When method get
	Then status 200
	And match response.[0].jobId == '#present'
	And match response.[0].experience[1] =='#notnull'
	And match response.[0].project[0].projectName == '#ignore'
	And match response.[0].project[0].technology == '#array'
	And match response.[0].jobTitle =='#string'
	#complex fuzzy matcher
	And match response.[0].jobId == '#? _ == 1'
	And match response.[0].jobTitle =='#string? _.length >=1'
	And match response.[0].experience =='#[3] #string? _.length >=2'
	
	