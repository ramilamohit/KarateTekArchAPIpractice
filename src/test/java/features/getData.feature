Feature: TekArch Karate Getdata

Scenario: Read data using GET CALL
#* def token = null
#* callonce read('classpath:features/GetToken.feature'){token : '#token'}
#* print token
* print baseUrl

Given url baseUrl + 'getdata'
And header token = token 
When method get
Then status 200
And match response == '#[]'
* def jsonResponse = response
* print jsonResponse[0]
* def id = jsonResponse[0].id
* def userid = jsonResponse[0].userid
* print 'Created data id: ' , id, 'and userid:' ,userid
* def responseschema =
 """
{ 
       accountno: '#string',
        departmentno: '#string',
        salary: '#string',
        pincode: '#string',
        userid: '#string',
        id: '#string'
}
"""
* match jsonResponse[0] == responseschema
       


 