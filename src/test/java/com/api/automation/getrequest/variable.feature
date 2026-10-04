Feature: Variable Creation in Karate Framework

Background: Create and initialize the variable
	* def app_name = "Google"
	 
Scenario: To Create a Variable
	Given def var_int = 10
	And def var_string = "Karate"
	Then print "String Variable ->" , var_string
	 * def var_int_2 = var_int +10
	And print "new variable ->", var_int_2
	And print "Background Variable -> ", app_name

	Scenario: To Create a Variable
	* def var_string = "Karate"
	Then print "String Variable ->" , var_string
	And print "Background Variable -> ", app_name
	