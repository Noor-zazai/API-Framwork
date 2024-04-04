Feature: Create a new Emp

  Background: 
    * def filePath = read(file_path)
    * def testDataFilePath = filePath.DeptTestData
    * def hrServerData = read(hrApiServerData)
    * print hrServerData
    * def baseURL =  env == 'scrum' ? hrServerData.baseScrumURL : hrServerData.baseSitURL
    * def getHeaderInfo = env == 'scrum' ? filePath.Headers+'@scrum' : filePath.Headers+'@sit'
    * print getHeaderInfo
    * def setHeader = call read(getHeaderInfo)
    * configure headers = setHeader.HEADER

  @deptPost
  Scenario Outline: Verify User able to Create new Department in Database
    * def apiURI = hrServerData.Department.PostNewDept
    * print apiURI
    * def endpoint = baseURL+apiURI
    * def generateTestData = call read(filePath.GenerateTestData+'@generateDeptData'){fileName:'#(testDataFilePath)', region: '<region>', index: '<index>'}
    * def data = read('classpath:'+filePath.DeptTestData)
    * print data
    * def request_body = read('classpath:'+ filePath.DeptPostRBody)
    * print request_body
    * set request_body.departmentName = data.<region>[<index>].departmentName
    * set request_body.managerId = data.<region>[<index>].managerId
    * set request_body.locationId = data.<region>[<index>].locationId
    * print request_body
    Given url endpoint
    And request request_body
    When method POST
    * print response

    @sit
    Examples: 
      | region | index |
      | sit    |     0 |

  #2.Retrieving the resource we create in scenario 1 with GET REQUEST
  @deptGet
  Scenario Outline: Verify User able to retrieve the existing Dept Information
    * def apiURI = hrServerData.Department.GetDeptById
    * def endpoint = baseURL+apiURI
    * def data = read('classpath:'+filePath.DeptTestData)
    * def PATH = <deptID>
    Given url endpoint
    And path PATH
    When method GET
    * print response

    @scrum
    Examples: 
      | region | index | deptID |
      | scrum  |     0 |    732 |

  #3.Updating the resource we create in scenario 1 with PUT REQUEST
  @deptPut
  Scenario Outline: Verify User able to Update Department Information
    * def apiURI = hrServerData.Department.PutExistingDept
    * def endpoint = baseURL+apiURI
    * def generateTestData = call read(filePath.GenerateTestData+'@generateDeptData'){fileName:'#(testDataFilePath)', region: '<region>', index: '<index>'}
    * def data = read('classpath:'+filePath.DeptTestData)
    * def request_body = read('classpath:'+ filePath.DeptPutRBody)
    * set request_body.departmentId = <deptID>
    * set request_body.departmentName = data.<region>[<index>].departmentName
    * set request_body.managerId = <managerId>
    * set request_body.locationId = <locationId>
    Given url endpoint
    * print request_body
    And request request_body
    When method PUT
    * print response

    @scrum
    Examples: 
      | region | index | deptID | managerId | locationId |
      | scrum  |     0 |    732 |       509 |       2500 |

  #4. Partially Updating the resource we create in scenario 1 with PATCH REQUEST
  @deptPatchManagerId
  Scenario Outline: Verify User able to update specific dept maanger field
    * def apiURI = hrServerData.Department.PatchExistingDeptManager
    * def endpoint = baseURL+apiURI
    * def request_body = read('classpath:'+ filePath.DeptPatchManagerRBody)
    * set request_body.departmentId = <deptID>
    * set request_body.managerId = <managerId>
    Given url endpoint
    * print request_body
    And request request_body
    When method PATCH
    * print response

    @scrum
    Examples: 
      | region | index | deptID | managerId |
      | scrum  |     0 |    732 |       509 |

  #5.Deleting the resource we create in scenario 1 with DELETE REQUEST
  @b15Dept
  Scenario Outline: Verify User able to delete existing Dept
    * def apiURI = hrServerData.Department.DeleteDeptByID
    * def endpoint = baseURL+apiURI
    * def PATH = <deptID>
    Given url endpoint
    And path PATH
    When method DELETE
    * print response

    @scrum
    Examples: 
      | region | index | deptID |
      | scrum  |     0 |    732 |
