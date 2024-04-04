package com.noorteck.qa.utils;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.Map;

import org.json.JSONException;

import com.github.javafaker.Faker;

public class DataGenerator extends JsonFileUtils {

	public void updateEmpID(String fileName, String region, String indexStr, String id)
			throws JSONException, IOException {
		int index = Integer.parseInt(indexStr);

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("employeeId", Integer.parseInt(id));

		modifyTestData(map, fileName, region, index);

	}

	 

	public void gernerateEmployeeData(String fileName, String region, String indexStr)
			throws JSONException, IOException {
		int index = Integer.parseInt(indexStr);

		Faker fakeData = new Faker();
		Map<String, Object> map = new LinkedHashMap<String, Object>();

		String firstName = fakeData.name().firstName();
		String lastName = fakeData.name().lastName();

		String email = firstName + "@test.com";
		String phone = fakeData.phoneNumber().cellPhone();

		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		String hireDate = sdf.format(fakeData.date().birthday());

		double minSalary = 10000;
		double maxSalary = 200000;
		System.out.println(fakeData.random().nextDouble());
		double salary = minSalary + (maxSalary - minSalary) * fakeData.random().nextDouble();

		salary = Double.parseDouble(String.format("%.2f", salary));
		double minCommission = 0.0;
		double maxCommission = 0.8;
		double commission = minCommission + (maxCommission - minCommission) * fakeData.random().nextDouble();

		commission = Double.parseDouble(String.format("%.2f", commission));

		map.put("firstName", firstName);
		map.put("lastName", lastName);
		map.put("email", email);
		map.put("phoneNumber", phone);
		map.put("salary", salary);
		map.put("comissionPct", commission);

		System.out.println("FirstName: " + firstName);
		System.out.println("LastName: " + lastName);
		System.out.println("Email: " + email);
		System.out.println("Phone: " + phone);
		System.out.println("Date: " + hireDate);
		System.out.println("Salary: " + salary);
		System.out.println("Commission: " + commission);

		modifyTestData(map, fileName, region, index);

	}
	
	//
	public void generateJobData(String fileName, String region, String indexStr) throws JSONException, IOException {
		
		int index = Integer.parseInt(indexStr);
		Faker fakeData = new Faker();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		
		/**
		 * Generate jobID, jobTitle, minSalar, maxSalary
		 */
		
		
		String jobID = fakeData.company().profession();
		
		
		String jobTitle = fakeData.company().industry();
		/**
		 * TODO fix jobID & jobTItle (we have max limit character
		 * 		make sure we do not exceed the max character...
		 */
		
		
		
		int minSalary = fakeData.number().numberBetween(1000, 5000);
		int maxSalary = fakeData.number().numberBetween(minSalary, 99999);
		
		
		map.put("jobId", jobID);
		map.put("jobTitle", jobTitle);
		map.put("minSalary", minSalary);
		map.put("maxSalary", maxSalary);
		
		
		
		System.out.println("JobID:" + jobID);
		System.out.println("JobTitle:"+ jobTitle);		
		System.out.println("minSalary:" + minSalary);
		System.out.println("maxSalary:"+ maxSalary);
		
		
		modifyTestData(map, fileName, region, index);
		
	}
	

	public void updateJob(String apiName, String region, String indexStr, String id)
			throws JSONException, IOException {
		int index = Integer.parseInt(indexStr);

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JobId", Integer.parseInt(id));

		modifyTestData(map, apiName, region, index);

	}
	
	
public void generateDeptData(String fileName, String region, String indexStr) throws JSONException, IOException {
		
		int index = Integer.parseInt(indexStr);
		Faker fakeData = new Faker();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		
		/**
		 * Generate deptId, deptName, managerId, locationId
		 */
		
		
		
		String departmentName = fakeData.educator().university();
	
		
		/**
		 * TODO fix deptID, deptName,managerId & locationId  (we have max limit character
		 * 		make sure we do not exceed the max character...
		 */
		
		
		
		
		map.put("departmentName", departmentName);
		
		
		
		
		
		System.out.println("departmentName: "+ departmentName);		
		
		
		modifyTestData(map, fileName, region, index);
	
}


	/**public static void main(String[] args) {
		DataGenerator obj = new DataGenerator();
		
		String fileName = "./src/test/java/com/noorteck/qa/data/department-api/DeptTestData.json";
		
		
		
	 	try {
			obj.generateJobData(fileName, "sit", "0");
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
**/


}
