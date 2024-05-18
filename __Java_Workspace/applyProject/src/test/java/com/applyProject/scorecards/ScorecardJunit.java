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
	
	public double round2dp(Double input) {
		
		double roundOff = Math.round(input * 100.0) / 100.0;
		
		return roundOff;
	}
	

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
		Scorecard sc1 = new Scorecard("jUnit_Test",999);
		String scoreCardName = sc1.getScorecardName();
		assertEquals("jUnit_Test",scoreCardName);
	}
	
	
	@Test
	@Timeout(10) 
	@DisplayName("Score set correctly")
	void score() {
		Scorecard sc1 = new Scorecard("score_junit",500);
		
		assertEquals(500,sc1.getScore());
	}
	
	@Test
	@Timeout(10) 
	@DisplayName("Add String Characteristic")
	void addStringCharacteristic() {
		
		Scorecard sc1 = new Scorecard("score_junit",999);
		@SuppressWarnings("unused")
		StringCharacteristic testChar = new StringCharacteristic("testChar","A",sc1,0);
		
//		testChar.setCharacteristicValue("A");
//		sc1.addCharacteristic(testChar);
		
		
		//Stack Overflow error when trying on an Array
//		System.out.println(gson.toJson(sc1));
//		System.out.println(gson.toJson(sc1.getCharacteristics()));
		
//		String expectedGsonOut = "{\"scorecardName\":\"score_junit\",\"score\":999,\"index\":1,\"stringCharacteristics\":[{\"characteristicValue\":\"A\",\"name\":\"testChar\",\"bandingScore\":0}],\"numberCharacteristics\":[]}";
				
		assertEquals(sc1.getStringCharacteristics().size(),1);
//		assertEquals(gson.toJson(sc1),expectedGsonOut);
	}
	
	@Test
	@Timeout(10) 
	@DisplayName("Add Numeric Characteristic")
	void addNumericCharacteristic() {
		
		Scorecard sc1 = new Scorecard("score_junit_numeric",999);
		NumericCharacteristic testChar = new NumericCharacteristic("testNumChar");
		
		testChar.setCharacteristicValue(50);
		sc1.addCharacteristic(testChar);
		
		
		//Stack Overflow error when trying on an Array
//		System.out.println(gson.toJson(sc1));
//		System.out.println(gson.toJson(sc1.getCharacteristics()));
		
//		String expectedGsonOut = "{\"scorecardName\":\"score_junit_numeric\",\"score\":999,\"index\":1,\"stringCharacteristics\":[],\"numberCharacteristics\":[{\"characteristicValue\":50.0,\"name\":\"testNumChar\",\"bandingScore\":0}]}";
		
		assertEquals(sc1.getNumberCharacteristics().size(),1);
//		assertEquals(gson.toJson(sc1),expectedGsonOut);
	}
	
	
	
	@Test
	@Timeout(10) 
	@DisplayName("Add Numeric Characteristic")
	void calculateProbofDefault() {
		
		Scorecard sc1 = new Scorecard("Test 1 score = 530",500);
//		Scorecard sc2 = new Scorecard("Test 1 score = 610",610);
		
		sc1.calculateProbofDefault(400);
		sc1.calculateProbofDefault(450);
		sc1.calculateProbofDefault(500);
		sc1.calculateProbofDefault(550);
		sc1.calculateProbofDefault(600);
		sc1.calculateProbofDefault(650);
		sc1.calculateProbofDefault(700);
		sc1.calculateProbofDefault(750);
		
		//This is initial problem run into, so check no infinete values to start
//		assertNotEquals(Double.POSITIVE_INFINITY, sc1.getProbOfDefault());
//		assertNotEquals(Double.NEGATIVE_INFINITY, sc1.getProbOfDefault());
		
		
		assertEquals(0.02, round2dp(sc1.getProbOfDefault()));
//		assertEquals(0.27, round2dp(sc2.getProbOfDefault()));
		
	}

}
