Feature: Create a new Emp

  Background: 
    * def filePath = read(file_path)
    * def testDataFilePath = filePath.EmpTestData
    * def hrServerData = read(hrApiServerData)
    * print hrServerData
    * def baseURL =  env == 'scrum' ? hrServerData.baseScrumURL : hrServerData.baseSitURL
    * def getHeaderInfo = env == 'scrum' ? filePath.Headers+'@scrum' : filePath.Headers+'@sit'
    * print getHeaderInfo
    * def setHeader = call read(getHeaderInfo)
    * configure headers = setHeader.HEADER

  @b11Test
  Scenario Outline: abc
    * def apiURI = hrServerData.Employee.PutExistingEmp
    * print apiURI
    * def endpoint = baseURL+apiURI
    * def generateTestData = call read(filePath.GenerateTestData+'@updateEmpId'){fileName:'#(testDataFilePath)', region: '<region>', index: '<index>', empId: '<empId>'}
    * def data = read('classpath:'+filePath.EmpTestData)
    * print data
    * def request_body = read('classpath:'+ filePath.EmpPutRBody)
    * print request_body
    * set request_body.employeeId = data.<region>[<index>].employeeId
    * set request_body.firstName = data.<region>[<index>].firstName
    * set request_body.lastName = data.<region>[<index>].lastName
    * set request_body.email = data.<region>[<index>].email
    * set request_body.phoneNumber = data.<region>[<index>].phoneNumber
    * set request_body.hireDate = data.<region>[<index>].hireDate
    * set request_body.jobId = data.<region>[<index>].jobId
    * set request_body.salary = data.<region>[<index>].salary
    * set request_body.comissionPct = data.<region>[<index>].comissionPct
    * set request_body.managerId = data.<region>[<index>].managerId
    * set request_body.departmentId = data.<region>[<index>].departmentId
    * print request_body
    Given url endpoint
    And request request_body
    When method PUT
    * print response
   
    Examples: 
      | region | index | empId |
      | sit    |     0 |   155 |
