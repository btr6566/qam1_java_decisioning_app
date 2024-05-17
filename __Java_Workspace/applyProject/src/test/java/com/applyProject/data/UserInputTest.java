package com.applyProject.data;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.applyProject.programData.Applicant;


//@Disabled these once done, as manual input goes against the indea of automated coverage

@DisplayName("UserInput Class tests")
class UserInputTest {

	@DisplayName("Get String Input = NOT NULL")
	@Test
	@Disabled
	void testGetStringInput() {
		
		UserInput up = new UserInput();
		
		String in1 = up.getStringInput("UNIT Test: Enter a string:");
		
		System.out.println("in1 = "+in1);
		assertNotNull(in1);
		
	}
	
	
	@DisplayName("Get getIntInput = NOT NULL")
	@Test
	@Disabled
	void testGetIntInput() {
		
		UserInput up = new UserInput();
		
		Integer in1 = up.getIntInput("UNIT Test: Enter a Integer:");
		
		System.out.printf("in1 = %d\n",in1);
		assertNotNull(in1);
		
	}
	
	@DisplayName("Residential Status - Valid")
	@Test
	@Disabled
	void testResidentialStatusValid() {
		
		UserInput up = new UserInput();
		
		Applicant appl1 = new Applicant();
		
		//Enter 1 to get what the Unit Test expects
		up.residentialStatusPrompt(appl1);
		
		assertEquals(ResidentialStatus.HomeOwner,appl1.getResidentialStatus());
		
		
	}
	
	//really need an Error logger for this to work well
	@DisplayName("Residential Status - Invalid (String)")
	@Test
	@Disabled
	void testResidentialStatusInvalidString() {
		
		UserInput up = new UserInput();
		
		Applicant appl1 = new Applicant();
		
		//Enter a to get what the Unit Test expects
		up.residentialStatusPrompt(appl1);
		
		assertEquals(null,appl1.getResidentialStatus());
		
		
	}
	

}
