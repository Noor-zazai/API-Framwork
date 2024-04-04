Feature: Set up Headers

  @generateEmpData
  Scenario: Headers with no Authentication
    * def javaClassObject = Java.type('com.noorteck.qa.utils.DataGenerator')
    * print fileName
    * def result = new javaClassObject().gernerateEmployeeData(fileName, region,index)

  @updateEmpId
  Scenario: Headers with no Authentication
    * def javaClassObject = Java.type('com.noorteck.qa.utils.DataGenerator')
    * print fileName
    * def result = new javaClassObject().updateEmpID(fileName, region,index, empId)

    
     @generateJobData
 Scenario: Headers with no Authentication
   * def javaClassObject = Java.type('com.noorteck.qa.utils.DataGenerator')
   * print fileName
   * def result = new javaClassObject().generateJobData(fileName, region,index)
 
   @UpdateJobData
 Scenario: Headers with no Authentication
   * def javaClassObject = Java.type('com.noorteck.qa.utils.DataGenerator')
   * print fileName
   * def result = new javaClassObject().generateJobData(fileName, region,index)
   @generateDeptData
 Scenario: Headers with no Authentication
   * def javaClassObject = Java.type('com.noorteck.qa.utils.DataGenerator')
   * print fileName
   * def result = new javaClassObject().generateDeptData(fileName, region,index)
 