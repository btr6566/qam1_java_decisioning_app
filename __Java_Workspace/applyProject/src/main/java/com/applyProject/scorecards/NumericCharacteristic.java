package com.applyProject.scorecards;

public class NumericCharacteristic extends BaseCharacteristic {

	
	////////////////
	// Properties
	///////////////	
	
	Integer characteristicValue;
	
	
	
	////////////////
	// Constructor
	///////////////	
	
	//Inherited
	public NumericCharacteristic(String name) {
		super(name);
	}
	
	
	public NumericCharacteristic(String name, Integer characteristicValue) {
		super(name);
		this.characteristicValue = characteristicValue;
		
	}
	
	
	
	//Use these to auto add to the Scorecard
//	public NumericCharacteristic(String name, Integer characteristicValue, Scorecard scorecard) {
//		super(name);
//		this.characteristicValue = characteristicValue;
//		scorecard.addCharacteristic(this);
//		
//	}
	
	
	//Use these to auto add to the Scorecard
	public NumericCharacteristic(String name, Integer characteristicValue, Scorecard scorecard, Integer bandingScore) {
		super(name);
		this.characteristicValue = characteristicValue;
		
		//Add to the Array of Characteristics in the scorecard, to keep them related 
		scorecard.addCharacteristic(this);
		
		//Add the Banding Score to the current score of the Scorecard
		scorecard.addBandingScoretoScore(bandingScore);
		
	}
	
	
	
	////////////////
	// Getters & Setters
	///////////////	
	public Integer getCharacteristicValue() {
		return characteristicValue;
	}



	public void setCharacteristicValue(Integer characteristicValue) {
		this.characteristicValue = characteristicValue;
	}
	
	
	

}
