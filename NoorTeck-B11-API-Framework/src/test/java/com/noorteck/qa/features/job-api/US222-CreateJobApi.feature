Feature: Create Job Functionality
 Background:
   * def filePath = read(file_path)
   * def testDataFilePath = filePath.JobTestData
   * print testDataFilePath
   * def hrServerData = read(hrApiServerData)
   * def baseURL =  env == 'scrum' ? hrServerData.baseScrumURL : hrServerData.baseSitURL
   * def getHeaderInfo = env == 'scrum' ? filePath.Headers+'@scrum' : filePath.Headers+'@sit'
   * def setHeader = call read(getHeaderInfo)
   * configure headers = setHeader.HEADER
 @monday1
 Scenario Outline: Verify User able to Create new Job
   * def apiURI = hrServerData.Job.PostNewJob
   * def endpoint = baseURL+apiURI
   * def generateTestData = call read(filePath.GenerateTestData+'@generateJobData'){fileName:'#(testDataFilePath)', region: '<region>', index: '<index>'}
   * def data = read('classpath:'+filePath.JobTestData)
   * def request_body =  read('classpath:'+ filePath.JobPostRBody)
   * set request_body.jobId = data.<region>[<index>].jobId
   * set request_body.jobTitle = data.<region>[<index>].jobTitle
   * set request_body.minSalary = data.<region>[<index>].minSalary
   * set request_body.maxSalary = data.<region>[<index>].maxSalary
   * print request_body
   Given url endpoint
   And request request_body
   When method POST
   * print response
   @scrum
   Examples:
     | region | index |
     | scrum  |     0 |
   @sit
   Examples:
     | region | index |
     | sit    |     0 |
     
     
   
