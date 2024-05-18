package com.applyProject.scorecards;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

//import com.applyProject.data.ResidentialStatus;


@DisplayName("Champion Characteristics")
class ChampionTest {

	@Test
	@DisplayName("Champion E1B07 cases correct")
	
	// I actually generated this with Co-Piolt, to see if it could make usable code
	// Unit Testing Scorecard Characteristics is normally a very tedious process, so was hoping this would be a good AI use case to save time
	// Works as expected :)
	public void testChampion_E1B07_score() {
		assertEquals(0, Champion.champion_E1B07_score("T"));
		assertEquals(0, Champion.champion_E1B07_score("N"));
		assertEquals(0, Champion.champion_E1B07_score("D"));
		assertEquals(0, Champion.champion_E1B07_score("U"));
		assertEquals(27, Champion.champion_E1B07_score("0"));
		assertEquals(14, Champion.champion_E1B07_score("1"));
		assertEquals(-10, Champion.champion_E1B07_score("2"));
		assertEquals(-23, Champion.champion_E1B07_score("3"));
		assertEquals(-23, Champion.champion_E1B07_score("4"));
		assertEquals(-23, Champion.champion_E1B07_score("5"));
		assertEquals(-23, Champion.champion_E1B07_score("6"));
		assertEquals(-50, Champion.champion_E1B07_score("8"));
		assertEquals(-50, Champion.champion_E1B07_score("invalid"));
		assertEquals(-50, Champion.champion_E1B07_score(null)); //Null is the 1 Unit Test I added
	}
	
	
	@Test
	@DisplayName("Champion E1B09 cases correct")
    public void testChampion_E1B09_score() {
        assertEquals(-20, Champion.champion_E1B09_score(-1));
        assertEquals(-20, Champion.champion_E1B09_score(0));
        assertEquals(10, Champion.champion_E1B09_score(1));
        assertEquals(10, Champion.champion_E1B09_score(2));
        assertEquals(20, Champion.champion_E1B09_score(3));
        assertEquals(20, Champion.champion_E1B09_score(4));
        assertEquals(30, Champion.champion_E1B09_score(5));
        assertEquals(30, Champion.champion_E1B09_score(6));
        assertEquals(18, Champion.champion_E1B09_score(7));
        assertEquals(18, Champion.champion_E1B09_score(8)); // Test a value greater than 7
        assertEquals(-20, Champion.champion_E1B09_score(-999)); // default
        assertEquals(-20, Champion.champion_E1B09_score(-2)); // Test a value less than -1
        assertEquals(-20, Champion.champion_E1B09_score(null));
    }
	
	
	@Test
	@DisplayName("Champion TRDA13 cases correct")
	public void testChampion_TRDA13_score() {
		assertEquals(40, Champion.champion_TRDA13_score(-3));
		assertEquals(-20, Champion.champion_TRDA13_score(-2));
		assertEquals(-20, Champion.champion_TRDA13_score(-1));
		assertEquals(-20, Champion.champion_TRDA13_score(0));
		assertEquals(10, Champion.champion_TRDA13_score(1));
		assertEquals(5, Champion.champion_TRDA13_score(2));
		assertEquals(-30, Champion.champion_TRDA13_score(3));
		assertEquals(-30, Champion.champion_TRDA13_score(4)); // Test a value greater than 3
		assertEquals(-30, Champion.champion_TRDA13_score(-999)); // default
		assertEquals(-30, Champion.champion_TRDA13_score(null)); // Test a null value
	}
	
	@Test
    public void testChampion_E1A09_score() {
        assertEquals(0, Champion.champion_E1A09_score(-1));
        assertEquals(46, Champion.champion_E1A09_score(0));
        assertEquals(24, Champion.champion_E1A09_score(1));
        assertEquals(24, Champion.champion_E1A09_score(2));
        assertEquals(-30, Champion.champion_E1A09_score(3));
        assertEquals(-30, Champion.champion_E1A09_score(4)); // Test a value greater than 3
        assertEquals(-30, Champion.champion_E1A09_score(-999)); // default
        assertEquals(-30, Champion.champion_E1A09_score(null)); // Test a null value
    }
	
//    @Test
//    public void testChampion_ResidentialStatus_score_enum() {
//        assertEquals(40, Champion.champion_ResidentialStatus_score(ResidentialStatus.HomeOwner));
//        assertEquals(26, Champion.champion_ResidentialStatus_score(ResidentialStatus.PrivateTenantFurnished));
//        assertEquals(34, Champion.champion_ResidentialStatus_score(ResidentialStatus.PrivateTenantUnfurnished));
//        assertEquals(10, Champion.champion_ResidentialStatus_score(ResidentialStatus.CouncilTenant));
//        assertEquals(34, Champion.champion_ResidentialStatus_score(ResidentialStatus.Cohabiting));
//        assertEquals(10, Champion.champion_ResidentialStatus_score(ResidentialStatus.LivingWithParents));
//        //Being an enum, would get a compile error trying another value
//    }
    
    @Test
    public void testChampion_ResidentialStatus_score_string() {
        assertEquals(40, Champion.champion_ResidentialStatus_score("HomeOwner"));
        assertEquals(26, Champion.champion_ResidentialStatus_score("PrivateTenantFurnished"));
        assertEquals(34, Champion.champion_ResidentialStatus_score("PrivateTenantUnfurnished"));
        assertEquals(10, Champion.champion_ResidentialStatus_score("CouncilTenant"));
        assertEquals(34, Champion.champion_ResidentialStatus_score("Cohabiting"));
        assertEquals(10, Champion.champion_ResidentialStatus_score("LivingWithParents"));

    }

}
