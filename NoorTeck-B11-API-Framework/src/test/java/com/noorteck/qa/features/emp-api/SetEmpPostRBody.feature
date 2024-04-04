Feature: HRAPI-Employeee Modulo SmokeTest Scenario

  @setBody
  Scenario Outline: Set up the request body for Employee Post Request
    * def data = read('classpath:'+filePath.EmpTestData)
    * def body = read('classpath:'+filePath.EmpPostRBody)
    * print 'Mumin'
    * print data
    * print body
    * print region
    * print index
    * def i = parseInt(index)
    * print data.region[i].firstName
    * print data.<region>[<index>].firstName
    * set body.firstName = data.region[i].firstName
    * set body.lastName = data.<region>[<index>].lastName
    * set body.email = data.<region>[<index>].email
    * set body.phoneNumber = data.<region>[<index>].phoneNumber
    * set body.hireDate = data.<region>[<index>].hireDate
    * set body.jobId = data.<region>[<index>].jobId
    * set body.salary = data.<region>[<index>].salary
    * set body.comissionPct = data.<region>[<index>].comissionPct
    * set body.managerId = data.<region>[<index>].managerId
    * set body.departmentId = data.<region>[<index>].departmentId

    Examples: 
      | region | index |
      | scrum  |     0 |
