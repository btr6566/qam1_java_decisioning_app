package com.applyProject.programData.offers;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.applyProject.programData.scorecards.Scorecard;

class OffersTest {

	@Test
	@DisplayName("Index 1 offer = 3000")
	public void indexEql1() {
		
		Scorecard sc1 = new Scorecard("Unit_test",700);
		Offers offer = new Offers();
		
		sc1.setIndex(1);
		
		offer.setMaxOffer(sc1.getIndex());
		
		assertEquals(3000, offer.getMaxOffer());
		
	}
	
	@Test
	@DisplayName("Index 2 offer = 2000")
	public void indexEql2() {
		
		Scorecard sc1 = new Scorecard("Unit_test",700);
		Offers offer = new Offers();
		
		sc1.setIndex(2);
		
		offer.setMaxOffer(sc1.getIndex());
		
		assertEquals(2000, offer.getMaxOffer());
		
	}
	
	@Test
	@DisplayName("Index 3 offer = 3000")
	public void indexEql3() {
		
		Scorecard sc1 = new Scorecard("Unit_test",700);
		Offers offer = new Offers();
		
		sc1.setIndex(3);
		
		offer.setMaxOffer(sc1.getIndex());
		
		assertEquals(1000, offer.getMaxOffer());
		
	}
	
	@Test
	@DisplayName("Index 4 offer = 0")
	public void indexEql4() {
		
		Scorecard sc1 = new Scorecard("Unit_test",700);
		Offers offer = new Offers();
		
		sc1.setIndex(4);
		
		offer.setMaxOffer(sc1.getIndex());
		
		assertEquals(0, offer.getMaxOffer());
		
	}
}
