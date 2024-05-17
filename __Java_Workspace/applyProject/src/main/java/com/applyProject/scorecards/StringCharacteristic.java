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
	
	public StringCharacteristic(String name, Integer bandingScore) {
		super(name, bandingScore);
	}
	
	
	//Use these to auto add to the Scorecard
	public StringCharacteristic(String name, String characteristicValue, Scorecard scorecard) {
		super(name);
		this.characteristicValue = characteristicValue;
		scorecard.addCharacteristic(this);
		
	}
	
	public StringCharacteristic(String name, Integer bandingScore, Scorecard scorecard) {
		super(name, bandingScore);
		scorecard.addCharacteristic(this);
		
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
