package com.applyProject.programData.offers;

public class Offers {

	//--------------
	//Properties
	//--------------
	private int maxOffer;

	//--------------
	// Constructors
	//--------------
	public Offers() {
		super();
	}

	//--------------
	// Getters and Setters
	//--------------
	public int getMaxOffer() {
		return maxOffer;
	}

	public void setMaxOffer(int index) {
		
		//Rely on a Business logic to set this, dependent on Index from Scorecard
		switch (index) {
		case 1: {
			this.maxOffer = 3000;
			break;
		}
		case 2: {
			this.maxOffer = 2000;
			break;
		}
		case 3: {
			this.maxOffer = 1000;
			break;
		}
		case 4: {
			this.maxOffer = 0;
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + index);
			
		}
		
	}
	
	
	
	
	
	
	
}
