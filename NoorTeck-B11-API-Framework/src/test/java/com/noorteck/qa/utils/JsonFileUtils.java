package com.noorteck.qa.utils;

import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class JsonFileUtils {

	/**
	 * This method converts JSON file to String
	 * 
	 * @param fileName
	 * @return
	 */
	public static String jsonToStrConvertion(String fileName) {
		String str = null;
		try {
			byte[] encoded = Files
					.readAllBytes(Paths.get(fileName));
			str = new String(encoded, Charset.defaultCharset());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}
	
	
	public static void main(String[] args) {
		String str = jsonToStrConvertion("./src/test/java/com/noorteck/qa/data/department-api/DeptTestData.json");
		
		System.out.println(str);
	}

	

	public static void modifyTestData(Map<String, Object> map,String fileName, String region, int index) throws JSONException, IOException {
		
		
		String jsonToString = JsonFileUtils.jsonToStrConvertion(fileName);
		
		
		JSONObject obj = new JSONObject(jsonToString);
		
		JSONArray regionArr = obj.getJSONArray(region);
		
		JSONObject regionData = regionArr.getJSONObject(index);
		

		for (Map.Entry<String, Object> entry : map.entrySet()) {

			String key = entry.getKey();
			Object value = entry.getValue();
			regionData.put(key, value);
			System.out.println(key + ":" + value);
		}

		System.out.println(obj.toString());

		FileWriter file = new FileWriter(fileName, false);
		file.write(obj.toString());
		file.flush();

	}

}
