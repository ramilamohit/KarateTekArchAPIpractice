Feature: CRUD operation using Json file 

Background:
* def token = null
* callonce read('classpath:features/GetToken.feature'){token : '#token'}
* print token
* print baseUrl

Scenario: CRUD create,read,update and delete data using json gile

#CREATE data using POST call
* def reqPayload = read('classpath:CreateData.json')
Given url baseUrl + 'addData'
And header token = token
And header Content-Type = 'application/json'
And request reqPayload
When method post
* def jsonObject = response
* print jsonObject
Then status 201
And match jsonObject.status == 'success'

#GET call to read data
Given url baseUrl
And path 'getdata'
And header token = token
When method get
Then status 200
* def jsonObject = response
* print jsonObject[0]
And match response == '#[]'
And match jsonObject[0].accountno == 'TA-123456'
And match jsonObject[0].departmentno == '9'
And match jsonObject[0].salary == '10000'
And match jsonObject[0].pincode == '77381'
* def id = jsonObject[0].id
* def userid = jsonObject[0].userid
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
* match jsonObject[0] == responseschema
       
#PUT call to update data
* def updatePayLoad = read('classpath:UpdateData.json')
Given url baseUrl + 'updateData'
And header token = token
And header Content-Type = 'application/json'
* def updatereqPayLoad =
"""
{ 
       accountno: '#(updatePayLoad.accountno)',
        departmentno: '#(updatePayLoad.departmentno)',
        salary: '#(updatePayLoad.salary)',
        pincode: '#(updatePayLoad.pincode)',
        userid: '#(userid)',
        id: '#(id)'
}
"""
And request updatereqPayLoad
* print updatereqPayLoad
When method put
Then status 200
* def jsonObject = response
* def status = jsonObject.status
* match status == 'success'

#GET CALL to read after updation
* def result = call read('classpath:features/getData.feature')
* def resultResponse = result.jsonResponse[0]
* print resultResponse
And match resultResponse.accountno == updatereqPayLoad.accountno
And match resultResponse.departmentno == updatereqPayLoad.departmentno
And match resultResponse.salary == updatereqPayLoad.salary
And match resultResponse.pincode == updatereqPayLoad.pincode


#DELETE call to delete the created data
Given url baseUrl + 'deleteData'
And header token = token
And header Content-Type = 'application/json'
* def deleteReqPayload =
"""
{
       userid: '#(result.userid)',
        id: '#(result.id)'
}
"""
And request deleteReqPayload
When method delete
Then status 200
* def jsonObject = response
* def status = jsonObject.status
* match status == 'success'

#GET CALL to check the deletion
* def result1 = call read('classpath:features/getData.feature')
* def resultResponse1 = result1.jsonResponse[0]
And match resultResponse1.accountno != updatereqPayLoad.accountno





