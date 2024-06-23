Feature: TekArchAPI Karate Framework

Scenario: Generate token using POST call
#* def config = karate.call('classpath:karate-config.js')
* def config = call read('classpath:karate-config.js')
Given url baseUrl + 'login'

 * print username
 * print password
 * def logincredential =
 """
 {
 "username" : "#(config.username)",
 "password" : "#(config.password)"
 }
 """
  And request logincredential
  When method post
 * print response
 * def jsonObject = response
 * def token = jsonObject[0].token
 * print token
 * def userid = jsonObject[0].userid
 * print userid 
 
 