package com.applyProject.scorecards;

import com.applyProject.data.EmploymentStatus;

public class Challanger {

	public static Integer challanger_NDSPCII_score(Integer NDSPCII) {

		Integer score = null;

		try {
			if (NDSPCII >= -3 && NDSPCII <= -1) {
				score = 0;
			} else if (NDSPCII >= 1 && NDSPCII <= 10) {
				score = 45;
			} else if (NDSPCII >= 11 && NDSPCII <= 20) {
				score = 23;
			} else if (NDSPCII >= 21 && NDSPCII <= 25) {
				score = 14;
			} else if (NDSPCII >= 26 && NDSPCII <= 40) {
				score = 5;
			} else if (NDSPCII >= 41 && NDSPCII <= 50) {
				score = -20;
			} else if (NDSPCII >= 51) {
				score = -40;
			} else {
				score = -40;
			}
		} catch (NullPointerException e) {
			score = -40;
		}

		return score;

	}

	public static Integer challanger_TRD_A_06_score(Integer TRD_A_06) {

		Integer score = null;

		try {
			if (TRD_A_06 == -2) {
				score = 0;
			} else if (TRD_A_06 == -1) {
				score = -10;
			} else if (TRD_A_06 == 0) {
				score = -20;
			} else if (TRD_A_06 == 1) {
				score = 6;
			} else if (TRD_A_06 == 2) {
				score = 14;
			} else if (TRD_A_06 >= 3) {
				score = 21;
			} else {
				score = -20;
			}
		} catch (NullPointerException e) {
			score = -20;
		}

		return score;

	}

	public static Integer challanger_E1B13_score(Integer E1B13) {

		Integer score = null;

		try {
			if (E1B13 == -1) {
				score = -10;
			} else if (E1B13 == 0) {
				score = 26;
			} else if (E1B13 == 1) {
				score = -12;
			} else if (E1B13 >= 2) {
				score = -56;
			} else {
				score = -56;
			}
		} catch (NullPointerException e) {
			score = -56;
		}

		return score;

	}

	public static Integer challanger_E1B01_score(Integer E1B01) {

		Integer score = null;

		try {
			if (E1B01 == -1) {
				score = 0;
			} else if (E1B01 == 0) {
				score = 34;
			} else if (E1B01 == 1) {
				score = 12;
			} else if (E1B01 == 2) {
				score = -11;
			} else if (E1B01 >= 3) {
				score = -33;
			} else {
				score = -33;
			}
		} catch (NullPointerException e) {
			score = -33;
		}

		return score;

	}
	
	
	public static Integer challanger_TRD_STL_19_score(Integer TRD_STL_19) {

		Integer score = null;

		try {
			if (TRD_STL_19 == -2) {
				score = 32;
			} else if (TRD_STL_19 == -1) {
				score = 0;
			} else if (TRD_STL_19 == 0) {
				score = 28;
			} else if (TRD_STL_19 == 1) {
				score = -14;
			} else if (TRD_STL_19 >= 1) {
				score = -27;
			} else {
				score = -27;
			}
		} catch (NullPointerException e) {
			score = -27;
		}

		return score;

	}
	
	
	public static Integer challanger_EmploymentStatus_score(EmploymentStatus status) {

		Integer score = null;


		try {
			switch (status) {
			case FullTime:
				score = 45;
				break;
			case PartTime:
				score = 24;
				break;
			case Student:
				score = 6;
				break;
			case SelfEmployed:
				score = 33;
				break;
			case Unemployed:
				score = -10;
				break;
			case Retired:
				score = 22;
				break;
			default:
				score = -10;
				break;
			}
		} catch (NullPointerException e) {
			score = -10;
		}
		
		return score;

	}
	
	public static Integer challanger_EmploymentStatus_score(String status) {

		Integer score = null;


		try {
			switch (status) {
			case "FullTime":
				score = 45;
				break;
			case "PartTime":
				score = 24;
				break;
			case "Student":
				score = 6;
				break;
			case "SelfEmployed":
				score = 33;
				break;
			case "Unemployed":
				score = -10;
				break;
			case "Retired":
				score = 22;
				break;
			default:
				score = -10;
				break;
			}
		} catch (NullPointerException e) {
			score = -10;
		}
		
		return score;

	}

}
