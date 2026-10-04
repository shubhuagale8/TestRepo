Feature: To create the job entry in the application
	Use POST /normal/webapi/add to create job entry in the application

Background: create and initialize base Url
	Given url 'http://localhost:9897'
	
Scenario: To create the job Entry in JSON format
	Given  path '/normal/webapi/add'
	And request {"jobId": 5, "jobTitle": "Software Engg-2","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": [ "Kotlin","SQL Lite","Gradle"]}]}
	And headers {Accept : 'application/json', content-Type: 'application/json'}
	When method post
	And status 201
	And print response
	And match response.jobTitle == 'Software Engg-2'
	
Scenario: To create the job Entry in XML format
	Given  path '/normal/webapi/add'
	And request <item><jobId>7</jobId><jobTitle>Software Engg</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>Mobile Iron</experience></experience><project><project><projectName>Movie App</projectName><technology><technology>Kotlin</technology><technology>SQL Lite</technology><technology>Gradle</technology></technology></project></project></item>
	And headers {Accept : 'application/json', content-Type: 'application/xml'}
	When method post
	And status 201
	And print response
	And match response.jobId == 7