package com.couponPeople.utils;

import java.io.Reader;
import java.util.Properties;

import org.apache.ibatis.io.Resources;

public class Myproperties {
	
	private String resource = "com/couponPeople/utils/env.properties";
	private Properties properties = new java.util.Properties();
	
	public Myproperties() {
		// TODO Auto-generated constructor stub
	}
	
	public Properties getProperties(){
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			properties.load(reader);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
		}
		return properties;
	}

}
