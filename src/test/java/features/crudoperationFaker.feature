Feature: CRUD operation 

Background:

* def token = null
* callonce read('classpath:features/GetToken.feature'){token : '#token'}
* print token
* print baseUrl

Scenario: CRUD operation with dynamic data 

#Data generation using Faker for dynamic data
Given def gataGeneration = Java.type('utils.FakerUtility')
* def randomAccountNo = gataGeneration.getAccountno()
* print randomAccountNo
* def randomDepartment = gataGeneration.getDepartmentNo()
* print randomDepartment
* def randomSalary = gataGeneration.getSalary()
* print randomSalary
* def randomPincode = gataGeneration.getPincode()
* print randomPincode

#Create new data using faker in post call
Given url baseUrl + 'addData'
And header token = token
And header Content-Type = 'application/json'
And request {"accountno" : "#(randomAccountNo)", "departmentno" : "#(randomDepartment)" , "salary" :"#(randomSalary)" , "pincode" : "#(randomPincode)"}
When method post
* def jsonObject = response
* print jsonObject
Then status 201
And match jsonObject.status == 'success'

#Check the newly created data using get call

* def result = call read('classpath:features/getData.feature')
* def resultResponse = result.jsonResponse[0]
And match resultResponse.accountno == randomAccountNo
And match resultResponse.departmentno == randomDepartment
And match resultResponse.salary == randomSalary
And match resultResponse.pincode == randomPincode
* def userid = resultResponse.userid
* def id =  resultResponse.id

#Data generation using Faker for dynamic data for update
* def randomAccountNo2 = gataGeneration.getAccountno()
* print randomAccountNo2
* def randomDepartment2 = gataGeneration.getDepartmentNo()
* print randomDepartment2
* def randomSalary2 = gataGeneration.getSalary()
* print randomSalary2
* def randomPincode2 = gataGeneration.getPincode()
* print randomPincode2

#PUT call to update data
Given url baseUrl + 'updateData'
And header token = token
And header Content-Type = 'application/json'
* def updatereqPayLoad =
"""
{ 
       accountno: "#(randomAccountNo2)",
        departmentno: "#(randomDepartment2)",
        salary: "#(randomSalary2)",
        pincode: "#(randomPincode2)",
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










       
