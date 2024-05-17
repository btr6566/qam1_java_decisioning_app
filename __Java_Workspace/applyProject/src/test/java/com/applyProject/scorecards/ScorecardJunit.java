package com.applyProject.scorecards;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assumptions.assumeTrue;

import org.junit.jupiter.api.BeforeAll;
//import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Timeout;

//import com.applyProject.scorecards.Scorecard;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;



@DisplayName("Scorecard class")
class ScorecardJunit {

	//////
	//Set up
	/////
	
	static GsonBuilder builder = new GsonBuilder(); 
	static Gson gson = builder.create();
	
	//Before all method must be static
	
	//Use Case: Methods are suitable for operations that need to be executed as soon as for the whole take a look at class, 
	//including setting up a database connection or initializing sources which can be shared among all test methods.
	@BeforeAll
	static void start() {
		System.out.println("Running Scorecard Test");
	}
	
//	@BeforeEach
//	static void init() {
//
//	}
	
	//////
	//Demo Tests
	/////
    @Test
    @DisplayName("DEMO - Precondition")
    @Disabled
    void abortedTest() {
        assumeTrue("abc".contains("Z"));
        fail("test should have been aborted");
    }
	
    
    
	//////
	//Actual Tests
	/////
	@Test
	@Timeout(10) 
	@DisplayName("Scorecard Name set correctly")
	void scorecardName() {
		Scorecard sc1 = new Scorecard("jUnit_Test");
		String scoreCardName = sc1.getScorecardName();
		assertEquals("jUnit_Test",scoreCardName);
	}
	
	
	@Test
	@Timeout(10) 
	@DisplayName("Score set correctly")
	void score() {
		Scorecard sc1 = new Scorecard("score_junit");
		
		sc1.setScore(500);
		
		assertEquals(500,sc1.getScore());
	}
	
	@Test
	@Timeout(10) 
	@DisplayName("Add String Characteristic")
	void addStringCharacteristic() {
		
		Scorecard sc1 = new Scorecard("score_junit",999,1);
		StringCharacteristic testChar = new StringCharacteristic("testChar");
		
		testChar.setCharacteristicValue("A");
		sc1.addCharacteristic(testChar);
		
		
		//Stack Overflow error when trying on an Array
		System.out.println(gson.toJson(sc1));
//		System.out.println(gson.toJson(sc1.getCharacteristics()));
		
		String expectedGsonOut = "{\"scorecardName\":\"score_junit\",\"score\":999,\"index\":1,\"stringCharacteristics\":[{\"characteristicValue\":\"A\",\"name\":\"testChar\",\"bandingScore\":0}],\"numberCharacteristics\":[]}";
				
		assertEquals(sc1.getStringCharacteristics().size(),1);
		assertEquals(gson.toJson(sc1),expectedGsonOut);
	}
	
	@Test
	@Timeout(10) 
	@DisplayName("Add Numeric Characteristic")
	void addNumericCharacteristic() {
		
		Scorecard sc1 = new Scorecard("score_junit_numeric",999,1);
		NumericCharacteristic testChar = new NumericCharacteristic("testNumChar");
		
		testChar.setCharacteristicValue(50);
		sc1.addCharacteristic(testChar);
		
		
		//Stack Overflow error when trying on an Array
		System.out.println(gson.toJson(sc1));
//		System.out.println(gson.toJson(sc1.getCharacteristics()));
		
		String expectedGsonOut = "{\"scorecardName\":\"score_junit_numeric\",\"score\":999,\"index\":1,\"stringCharacteristics\":[],\"numberCharacteristics\":[{\"characteristicValue\":50.0,\"name\":\"testNumChar\",\"bandingScore\":0}]}";
		
		assertEquals(sc1.getNumberCharacteristics().size(),1);
		assertEquals(gson.toJson(sc1),expectedGsonOut);
	}

}
