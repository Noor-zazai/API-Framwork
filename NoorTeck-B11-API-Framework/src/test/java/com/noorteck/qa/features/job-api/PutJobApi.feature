Feature: PUT Api

  Background: 
    * def filePath = read(file_path)
    * def testDataFilePath = filePath.JobTestData
    * def hrServerData = read(hrApiServerData)
    * def baseURL =  env == 'scrum' ? hrServerData.baseScrumURL : hrServerData.baseSitURL
    * def getHeaderInfo = env == 'scrum' ? filePath.Headers+'@scrum' : filePath.Headers+'@sit'
    * def setHeader = call read(getHeaderInfo)
    * configure headers = setHeader.HEADER
    @PutREQ
     #1.Update existing resource PUT REQUEST
  Scenario Outline: Verify User able to update existing Job
    * def apiURI = hrServerData.Job.PutExistingJob
    * print apiURI
    * def endpoint = baseURL+apiURI
    * def generateTestData = call read(filePath.GenerateTestData+'@updateJob'){fileName:'#(testDataFilePath)', region: '<region>', index: '<index>', jobId: '<jobId>'}
    * def data = read('classpath:'+filePath.JobTestData)
    * print data
    * def request_body = read('classpath:'+ filePath.JobPutRBody)
    * print request_body
    * set request_body.jobId = <jobId>
    * set request_body.jobTitle = data.<region>[<index>].jobTitle
    * set request_body.minSalary = data.<region>[<index>].minSalary
    * set request_body.maxSalary = data.<region>[<index>].maxSalary
    
    * print request_body
    Given url endpoint
    And request request_body
    When method PUT
    * print response

    @scrum
    Examples: 
      | region | index |jobId|
      | scrum  |     0 |"doctor"|

    @sit
    Examples: 
      | region | index |jobId| 
      | sit    |     0 |"doctor"|
