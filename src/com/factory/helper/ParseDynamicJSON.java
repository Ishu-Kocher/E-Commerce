package com.factory.helper;

import java.util.Iterator;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ParseDynamicJSON {
	
	public static void parseObject(JSONObject json, String key) throws JSONException {
		//System.out.println(json.has(key));
		System.out.println(json.get(key));
	}
	
	public static void getKey(JSONObject json, String key) throws JSONException {
		
		boolean exists = json.has(key);
		Iterator<?> keys;
		String nextKeys;
		
		if(!exists) {
			
			keys=json.keys();
			while(keys.hasNext()) {
				nextKeys=(String)keys.next();
				try {
					
					if(json.get(nextKeys) instanceof JSONObject) {
						
						if(exists == false) {
							getKey(json.getJSONObject(nextKeys), key);
						}
					
					}else if(json.get(nextKeys) instanceof JSONArray) {
						JSONArray jsonarray = new JSONArray(nextKeys);
						for(int i=0;i<jsonarray.length();i++) {
							String jsonarrayString = jsonarray.get(i).toString();
							JSONObject innerJson = new JSONObject(jsonarrayString);
							
							if(exists == false) {
								getKey(innerJson, key);
							}
							
						}
					}
					
					
					
				}catch(Exception e) { e.printStackTrace(); }
			}
			
			
			
		}else {
			parseObject(json, key);
		}
	}
}
