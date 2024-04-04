Feature: Patch Api

  Background: 
    * def filePath = read(file_path)
    * def testDataFilePath = filePath.EmpTestData
    * def hrServerData = read(hrApiServerData)
    * def baseURL =  env == 'scrum' ? hrServerData.baseScrumURL : hrServerData.baseSitURL
    * def getHeaderInfo = env == 'scrum' ? filePath.Headers+'@scrum' : filePath.Headers+'@sit'
    * def setHeader = call read(getHeaderInfo)
    * configure headers = setHeader.HEADER

  #1.Update Partially existing resource Patch REQUEST
  Scenario Outline: Verify User able to update partially existing Employee
    * def apiURI = hrServerData.Employee.PatchExistingEmp
    * print apiURI
    * def endpoint = baseURL+apiURI
    * def generateTestData = call read(filePath.GenerateTestData+'@updateEmpId'){fileName:'#(testDataFilePath)', region: '<region>', index: '<index>', empId: '<empId>'}
    * def data = read('classpath:'+filePath.EmpTestData)
    * print data
    * def request_body = read('classpath:'+ filePath.EmpPatchRBody)
    * print request_body
    * set request_body.employeeId = data.<region>[<index>].employeeId
    * set request_body.firstName = data.<region>[<index>].firstName
    * set request_body.lastName = data.<region>[<index>].lastName
    * set request_body.phoneNumber = data.<region>[<index>].phoneNumber
    * print request_body
    Given url endpoint
    And request request_body
    When method PATCH
    * print response

    @scrum
    Examples: 
      | region | index |
      | scrum  |     0 |

    @sit
    Examples: 
      | region | index | empId |
      | sit    |     0 |   105 |
