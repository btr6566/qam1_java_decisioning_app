package com.applyProject.scorecards;

public class StringCharacteristic extends BaseCharacteristic {

	////////////////
	// Properties
	///////////////	
	
	private String characteristicValue;
	
	////////////////
	// Constructor
	///////////////	
	
	//Inherited
	public StringCharacteristic(String name) {
		super(name);
	}
	
	public StringCharacteristic(String name, String characteristicValue) {
		super(name);
		this.characteristicValue = characteristicValue;
		
	}
	
	
	//Use these to auto add to the Scorecard
//	public StringCharacteristic(String name, String characteristicValue, Scorecard scorecard) {
//		super(name);
//		this.characteristicValue = characteristicValue;
//		scorecard.addCharacteristic(this);
//		
//	}
	

	public StringCharacteristic(String name, String characteristicValue, Scorecard scorecard, Integer bandingScore) {
		super(name);
		this.characteristicValue = characteristicValue;
		this.bandingScore = bandingScore;
		
		//Add to the Array of Characteristics in the scorecard, to keep them related 
		scorecard.addCharacteristic(this);
		
		//Add the Banding Score to the current score of the Scorecard
		scorecard.addBandingScoretoScore(bandingScore);
		
	}
	


	////////////////
	// Getter & Setters
	///////////////	
	
	public String getCharacteristicValue() {
		return characteristicValue;
	}


	public void setCharacteristicValue(String characteristicValue) {
		this.characteristicValue = characteristicValue;
	}
	
	
	

}
