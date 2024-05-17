package com.applyProject.scorecards;



//Needs to be a class to hold Data, Try an interface for the Set Characteristic?
// Effectively abstract, since will always be character or numeric & and extend rather then 1 size fit all
public abstract class BaseCharacteristic {

	////////////////
	// Properties
	///////////////
	String name; //name of the Characterisitc e.g. E1B08
	Integer bandingScore; //Score we're assigning 

	
	//For Value - Extend for Character & Numeric, Can add to Array via Polymorphism
	
	
	////////////////
	// Constructor
	///////////////	
	
	//Idea of this constructor is that a characterisitc must be initalised with a Name & the Scorecard it belongs to
	public BaseCharacteristic(String name) {
		super();
		this.name = name;
	}
	
	public BaseCharacteristic(String name, Integer bandingScore) {
		super();
		this.name = name;
		this.bandingScore = bandingScore;
	}
	


	////////////////
	// Getters & Setters
	///////////////	
	public String getName() {
		return name;
	}

	public int getBandingScore() {
		return bandingScore;
	}

	public void setBandingScore(Integer bandingScore) {
		this.bandingScore = bandingScore;
	}
	
	
	
	
}
