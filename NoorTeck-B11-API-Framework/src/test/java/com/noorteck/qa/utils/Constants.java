package com.noorteck.qa.utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class Constants {

	public final static String CLASSNAME = "com.mysql.cj.jdbc.Driver";
	public static Connection connection = null;
	public static Statement statement = null;
	public static ResultSet rs = null;
	public static List<LinkedHashMap<String, String>> resultsetInListOfMaps = new ArrayList<LinkedHashMap<String, String>>();
	public static Map<String, Object> envDataMap = new LinkedHashMap<String, Object>();
	public static String query = "SELECT manager_id, department_id, job_id FROM employees WHERE manager_id IS NOT NULL ORDER BY RAND() LIMIT 1;";
}
