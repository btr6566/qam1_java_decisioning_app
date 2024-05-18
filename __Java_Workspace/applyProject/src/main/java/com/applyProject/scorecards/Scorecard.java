package com.applyProject.scorecards;

import java.util.ArrayList;

public class Scorecard {

	
	//////////////////
	// Class Properties
	/////////////////
	
	private String scorecardName;
	private int score;
	private int index;
	private Double probOfDefault; //Float might be fine
	
	//Create an Array to hold Characteristics
	//PROBLEM - When using gson.toJSON(), characteristicValue changes Datatypes, negating the point
	private ArrayList<BaseCharacteristic> stringCharacteristics;
	private ArrayList<BaseCharacteristic> numberCharacteristics;

	
	//////////////////
	// Constructors
	/////////////////
	
	//Are these needed for an abstract class?
	//Answer = Stack Overflow. (2008). Can an abstract class have a constructor?. [Online]. Stack Overflow
	//			Last Updated: Updated Dec 30, 2016. Available at: https://stackoverflow.com/questions/260666/can-an-abstract-class-have-a-constructor [Accessed 3 May 2024].
	
	
	// You can and they are useful for enforcing required values
	// I want to always have a Scorecard Name, so apply here
//	public Scorecard(String scorecardName) {
//		super();
//		this.scorecardName = scorecardName;
//		
//		//Need to Initalise Array to avoid a Runtime Error
//		this.stringCharacteristics = new ArrayList<>();
//		this.numberCharacteristics = new ArrayList<>();
//	}

	
	

	public Scorecard(String scorecardName, int score) {
		super();
		this.scorecardName = scorecardName;
		this.score = score;
		
		//Need to Initalise Array to avoid a Runtime Error
		this.stringCharacteristics = new ArrayList<>();
		this.numberCharacteristics = new ArrayList<>();
	}




	//////////////////
	// Getters and Setters
	/////////////////
	public String getScorecardName() {
		return scorecardName;
	}

	//ScorecardName must be set when Constructing the object. Do not allow overwrite
//	private void setScorecardName(String scorecardName) {
//		this.scorecardName = scorecardName;
//	}


	public int getScore() {
		return score;
	}


	@SuppressWarnings("unused")
	private void setScore(int score) {
		this.score = score;
	}


	public int getIndex() {
		return index;
	}


	public void setIndex(int index) {
		this.index = index;
	}


	public Double getProbOfDefault() {
		return probOfDefault;
	}


	public void setProbOfDefault(Double probOfDefault) {
		this.probOfDefault = probOfDefault;
	}
	
	
		
	public ArrayList<BaseCharacteristic> getStringCharacteristics() {
		return stringCharacteristics;
	}

	public ArrayList<BaseCharacteristic> getNumberCharacteristics() {
		return numberCharacteristics;
	}

//	public void setCharacteristics(ArrayList<BaseCharacteristic> characteristics) {
//		this.characteristics = characteristics;
//	}



	//////////////////
	// Other Methods
	/////////////////
	public void addCharacteristic(StringCharacteristic characteristic) {
		
		//Expectation is can use 1 method, as String & Numeric extend this Base class
		stringCharacteristics.add(characteristic);
		
	}
	
	public void addCharacteristic(NumericCharacteristic characteristic) {
		
		//Expectation is can use 1 method, as String & Numeric extend this Base class
		numberCharacteristics.add(characteristic);
		
	}
	
	public void addBandingScoretoScore(Integer bandingScore) {
		
		this.score += bandingScore;
		
	}
	
	
}
