package com.applyProject.scorecards;

import static org.junit.jupiter.api.Assertions.*;

//import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Timeout;


@DisplayName("Characteristic classes")
class CharacteristicTest {

	@Test
	@Timeout(10)
	@DisplayName("String Characteristic - Name set correctly")
	void scorecardName() {
		
//		Scorecard sc1 = new Scorecard("jUnit_Test");
		
		StringCharacteristic c1 = new StringCharacteristic("Test Characteristic");
		
		String c1name = c1.getName();

		assertEquals("Test Characteristic",c1name);
	}

}
