Feature: HRAPI-Employeee Modulo SmokeTest Scenario

  Background: 
    * def filePath = read(file_path)
    * print filePath
    * def testDataFilePath = filePath.EmpTestData
    * def hrServerData = read(hrApiServerData)
    * def baseURL =  env == 'scrum' ? hrServerData.baseScrumURL : hrServerData.baseSitURL
    * def getHeaderInfo = env == 'scrum' ? filePath.Headers+'@scrum' : filePath.Headers+'@sit'
    * print getHeaderInfo
    * def setHeader = call read(getHeaderInfo)
    * configure headers = setHeader.HEADER

  @jsonDemo
  Scenario Outline: Verify User able to retrieve all managers
    * def apiURI = hrServerData.Employee.GetAllManagers
    * def endpoint = baseURL+apiURI
    And url endpoint
    When method GET
    * print response
    * print response.managers[0]
    * print response.managers[0].employees
    * print response.managers[0].employees[1].firstName
    * def empNameList = karate.jsonPath(response, "$.managers[0].employees[*].firstName")
    * print empNameList
    Then match response.managers[0].firstName == 'AbdulLLLLLLLLLLL'
    And match response.managers[0].employeeId == 115
    And match response.managers[0].employeeId != 123
    And match response.managers[0].employeeId == 1111

    # retrieve list of all the employees  that report to manager at position index zero
    # retrieve list of all the employees firstName only that report to manager at position index zero
    @sit
    Examples: 
      | region | index |
      | scrum  |     0 |
