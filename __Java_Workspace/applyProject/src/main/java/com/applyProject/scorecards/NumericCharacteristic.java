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
	public NumericCharacteristic(String name, Integer characteristicValue, Scorecard scorecard) {
		super(name);
		this.characteristicValue = characteristicValue;
		scorecard.addCharacteristic(this);
		
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
