package com.applyProject.data;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class ResidentialStatusTest {

	@DisplayName("Test enum toString()")
	@Test
	void test() {
		
		ResidentialStatus rStatus = ResidentialStatus.HomeOwner;
		
		System.out.println(rStatus.toString());
		
	}

}