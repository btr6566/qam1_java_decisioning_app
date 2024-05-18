package com.applyProject.scorecards;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import com.applyProject.data.EmploymentStatus;

class ChallangerTest {

	@Test
	public void testChallanger_NDSPCII_score() {
		assertEquals(0, Challanger.challanger_NDSPCII_score(-3));
		assertEquals(0, Challanger.challanger_NDSPCII_score(-1));
		assertEquals(45, Challanger.challanger_NDSPCII_score(1));
		assertEquals(45, Challanger.challanger_NDSPCII_score(10));
		assertEquals(23, Challanger.challanger_NDSPCII_score(11));
		assertEquals(23, Challanger.challanger_NDSPCII_score(20));
		assertEquals(14, Challanger.challanger_NDSPCII_score(21));
		assertEquals(14, Challanger.challanger_NDSPCII_score(25));
		assertEquals(5, Challanger.challanger_NDSPCII_score(26));
		assertEquals(5, Challanger.challanger_NDSPCII_score(40));
		assertEquals(-20, Challanger.challanger_NDSPCII_score(41));
		assertEquals(-20, Challanger.challanger_NDSPCII_score(50));
		assertEquals(-40, Challanger.challanger_NDSPCII_score(51));
		assertEquals(-40, Challanger.challanger_NDSPCII_score(null));
	}

	@Test
	public void testChallanger_TRD_A_06_score() {
		assertEquals(0, Challanger.challanger_TRD_A_06_score(-2));
		assertEquals(-10, Challanger.challanger_TRD_A_06_score(-1));
		assertEquals(-20, Challanger.challanger_TRD_A_06_score(0));
		assertEquals(6, Challanger.challanger_TRD_A_06_score(1));
		assertEquals(14, Challanger.challanger_TRD_A_06_score(2));
		assertEquals(21, Challanger.challanger_TRD_A_06_score(3));
		assertEquals(-20, Challanger.challanger_TRD_A_06_score(null));
	}

	@Test
	public void testChallanger_E1B13_score() {
		assertEquals(-10, Challanger.challanger_E1B13_score(-1));
		assertEquals(26, Challanger.challanger_E1B13_score(0));
		assertEquals(-12, Challanger.challanger_E1B13_score(1));
		assertEquals(-56, Challanger.challanger_E1B13_score(2));
		assertEquals(-56, Challanger.challanger_E1B13_score(null));
	}

	@Test
	public void testChallanger_E1B01_score() {
		assertEquals(0, Challanger.challanger_E1B01_score(-1));
		assertEquals(34, Challanger.challanger_E1B01_score(0));
		assertEquals(12, Challanger.challanger_E1B01_score(1));
		assertEquals(-11, Challanger.challanger_E1B01_score(2));
		assertEquals(-33, Challanger.challanger_E1B01_score(3));
		assertEquals(-33, Challanger.challanger_E1B01_score(null));
	}

	@Test
	public void testChallanger_TRD_STL_19_score() {
		assertEquals(32, Challanger.challanger_TRD_STL_19_score(-2));
		assertEquals(0, Challanger.challanger_TRD_STL_19_score(-1));
		assertEquals(28, Challanger.challanger_TRD_STL_19_score(0));
		assertEquals(-14, Challanger.challanger_TRD_STL_19_score(1));
		assertEquals(-27, Challanger.challanger_TRD_STL_19_score(2));
		assertEquals(-27, Challanger.challanger_TRD_STL_19_score(null));
	}

	@Test
	public void testChallanger_EmploymentStatus_score_enum() {
		assertEquals(45, Challanger.challanger_EmploymentStatus_score(EmploymentStatus.FullTime));
		assertEquals(24, Challanger.challanger_EmploymentStatus_score(EmploymentStatus.PartTime));
		assertEquals(6, Challanger.challanger_EmploymentStatus_score(EmploymentStatus.Student));
		assertEquals(33, Challanger.challanger_EmploymentStatus_score(EmploymentStatus.SelfEmployed));
		assertEquals(-10, Challanger.challanger_EmploymentStatus_score(EmploymentStatus.Unemployed));
		assertEquals(22, Challanger.challanger_EmploymentStatus_score(EmploymentStatus.Retired));
//		assertEquals(-10, Challanger.challanger_EmploymentStatus_score(null));
	}
}
