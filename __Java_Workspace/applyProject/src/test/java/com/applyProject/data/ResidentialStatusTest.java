package com.applyProject.data;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.applyProject.enums.ResidentialStatus;

class ResidentialStatusTest {

	@DisplayName("Test enum toString()")
	@Test
	void test() {
		
		ResidentialStatus rStatus = ResidentialStatus.HomeOwner;
		
		System.out.println(rStatus.toString());
		
	}

}
