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
@jsonDemo1
 Scenario Outline: Verify User able to retrieve all managers
   * def apiURI = hrServerData.Employee.GetAllManagers
   * def endpoint = baseURL+apiURI
   And url endpoint
   When method GET
   * print response
   @sit
   Examples:
     | region | index |
     | scrum  |     0 |

