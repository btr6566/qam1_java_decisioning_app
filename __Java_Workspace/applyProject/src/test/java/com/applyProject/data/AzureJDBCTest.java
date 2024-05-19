package com.applyProject.data;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Properties;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

class AzureJDBCTest {
	
	//--------
	//Global variables needed in all tests
	//--------
	
	
	static String jdbcUser; //Database username
	static String jdbcPwd; //database password
	
	
	@BeforeAll
	static void testSetup() {
		
		//https://www.baeldung.com/java-properties
		//https://stackoverflow.com/questions/13011892/how-to-locate-the-path-of-the-current-project-directory-in-java-ide
		
		String appConfigPath = System.getProperty("user.dir") + "\\src\\appConfig.properties";
		Properties appConfig = new Properties();
		try {
			appConfig.load(new FileInputStream(appConfigPath));
		} catch (FileNotFoundException e) {
			e.getMessage();
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//Read the Credentials
		jdbcUser = appConfig.getProperty("jdbcUser");
		jdbcPwd = appConfig.getProperty("jdbcPwd");
		
		
		System.out.println(appConfigPath);
		System.out.println(jdbcUser);
		System.out.println(jdbcPwd);
		
		
		AzureJDBC db = new AzureJDBC(
				jdbcUser
				,jdbcPwd //Look into how to hide this, shouldn't be hard-coded into the program
			);
		
		db.wakeUpAzureDb();
	}


//	@Test
//	void testGetDecisionData() {
//		fail("Not yet implemented");
//	}
	
	@Test 
	void testGetMinDecisionDataId(){
		
		//Create the DB Connection to use in Tests
		AzureJDBC db = new AzureJDBC(
				jdbcUser
				,jdbcPwd //Look into how to hide this, shouldn't be hard-coded into the program
			);
		
		int test = db.getMinDecisionDataId();

		assertEquals(test, 1);
		
	}
	
	@Test 
	void testGetMaxDecisionDataId(){
		
		AzureJDBC db = new AzureJDBC(
				jdbcUser
				,jdbcPwd //Look into how to hide this, shouldn't be hard-coded into the program
			);
		
		
		int test = db.getMaxDecisionDataId();

		assertEquals(test, 1);
		
	}

}
