Feature: print hello world feature

Scenario: Hello World Scenario
	* print 'Hello World'
	* print 'Practing Karate framework'

Scenario: Declare variable and calculate

	* def priceA = 45
	* def priceB = 50
	* def tax = 5
	* print 'total amount->' + (priceA + priceB + tax)
	
Scenario: School Supplies

	* def notes = 8
	* def books = 46
	* def scissors = 7
	* def waterBottle = 9
	* def bag = 110
	* def shoe = 140
	* def amount = (notes + books + scissors + waterBottle + bag + shoe)
	* print 'amount->' + amount
	* print 'for 2 kids->' + (amount * 2 ) 

Scenario: Creating and reading simple JsonObject

  * def jsonObject =
 """
 {  
    "employee": {  
        "name":       "sonoo",   
        "salary":      56000,   
        "married":    true  
    }  
}
 """
 * print jsonObject
 * print jsonObject.employee.name
 * print jsonObject.employee.salary
 
 Scenario: Creating and reading complex JsonObject

  * def jsonObject =
 """
 {"menu": {  
  "id": "file",  
  "value": "File",  
  "popup": {  
    "menuitem": [  
      {"value": "New", "onclick": "CreateDoc()"},  
      {"value": "Open", "onclick": "OpenDoc()"},  
      {"value": "Save", "onclick": "SaveDoc()"}  
    ]  
  }  
}}  
 """
 * print jsonObject
 * print jsonObject.menu
 * print jsonObject.menu.popup.menuitem[2].onclick
 * print jsonObject.menu.popup.menuitem[1].value
 
 Scenario: Creating and reading own JsonObject

  * def jsonObject =
 """
 [
{
  	"name" : "Ramila",
  	"course" : "karate"
},
{
  	"name" : "Bala",
  	"course" : "java"
}
]
"""
 * print jsonObject
 * print jsonObject[0].name
 * print jsonObject[1].course
 

