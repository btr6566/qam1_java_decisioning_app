package com.applyProject.scorecards;

//import com.applyProject.data.ResidentialStatus;


//Use some Static Methods, as Scores assigned will be unique to a Scorecard
public class Champion {

	//E1B07
	public static Integer champion_E1B07_score(String E1B07) {
		
		Integer score = null;
		
		try {
			switch (E1B07) {
			case "T":
			case "N":
			case "D":
			case "U":
				score = 0;
				break;
			case "0":
				score = 27;
				break;	
			case "1":
				score = 14;
				break;	
			case "2":
				score = -10;
				break;	
			case "3":
			case "4":
			case "5":
			case "6":
				score = -23;
				break;	
				//Lack of a "7" case is intentional, as this isn't a valid value in the variable
			case "8":
				score = -50;
				break;	
			default:
				score = -50;
				break;
			}
		} catch (NullPointerException e) {
			score = -50;
		}
		
		return score;

	}
	
	//E1B09
	public static Integer champion_E1B09_score(Integer E1B09) {
		
		Integer score = null;
		
		try {
			if (E1B09 >= -1 && E1B09 <= 0) {
				score = -20;
			} else if (E1B09 >= 1 && E1B09 <= 2) {
				score = 10;
			} else if (E1B09 >= 3 && E1B09 <= 4) {
				score = 20;
			} else if (E1B09 >= 5 && E1B09 <= 6) {
				score = 30;
			} else if (E1B09 >= 7) {
				score = 18;
			} else {
				score = -20;
			}	
		} catch (NullPointerException e) {
			score = -20;
		}
		
		return score;
	}
	
	
	//TRD-A-13
	public static Integer champion_TRDA13_score(Integer TRDA13) {

		Integer score = null;

		try {
			if (TRDA13 == -3) {
				score = 40;
			} else if (TRDA13 == -2) {
				score = -20;
			} else if (TRDA13 >= -1 && TRDA13 <= 0) {
				score = -20;
			} else if (TRDA13 == 1) {
				score = 10;
			} else if (TRDA13 == 2) {
				score = 5;
			} else if (TRDA13 >= 3) {
				score = -30;
			} else {
				score = -30;
			}
		} catch (NullPointerException e) {
			score = -30;
		}
		return score;

	}

	//E1A09
	public static Integer champion_E1A09_score(Integer E1A09) {
		
		Integer score = null;
		
		try {
			if (E1A09 == -1) {
				score = 0;
			} else if (E1A09 == 0) {
				score = 46;
			} else if (E1A09 >= 1 && E1A09 <= 2) {
				score = 24;
			}  else if (E1A09 >= 3) {
				score = -30;
			} else {
				score = -30;
			}
		} catch (NullPointerException e) {
			score = -30;
		}
		return score;

	}

	//TRD-STL-14
	public static Integer champion_TRDSTL14_score(Integer TRDA13) {

		Integer score = null;

		try {
			if (TRDA13 == -2) {
				score = 26;
			} else if (TRDA13 == -1) {
				score = 0;
			} else if (TRDA13 == 0) {
				score = 26;
			} else if (TRDA13 >= 1 && TRDA13 <= 6) {
				score = -24;
			} else if (TRDA13 >= 7 && TRDA13 <= 18) {
				score = -15;
			} else if (TRDA13 >= 19 && TRDA13 <= 36) {
				score = 6;
			} else if (TRDA13 > 36) {
				score = 15;
			} else {
				score = -24;
			}
		} catch (NullPointerException e) {
			score = -30;
		}
		return score;

	}
	
	
	//ResidentialStatus (scorecard)
//	public static Integer champion_ResidentialStatus_score(ResidentialStatus rStatus) {
//		
//		Integer score = null;
//		
//		String rStatusstring = rStatus.toString();
//		
//		try {
//			switch (rStatusstring) {
//			case "HomeOwner":
//				score = 40;
//				break;
//			case "PrivateTenantFurnished":
//				score = 26;
//				break;
//			case "PrivateTenantUnfurnished":
//				score = 34;
//				break;
//			case "CouncilTenant":
//				score = 10;
//				break;
//			case "Cohabiting":
//				score = 34;
//				break;
//			case "LivingWithParents":
//				score = 10;
//				break;
//			default:
//				score = 10;
//				break;
//			}
//		} catch (NullPointerException e) {
//			score = 10;
//		}
//		
//		return score;
//
//	}
	
	//Need a string version to be compatible with StringCharacteristic
	public static Integer champion_ResidentialStatus_score(String rStatus) {
		
		Integer score = null;
		
		try {
			switch (rStatus) {
			case "HomeOwner":
				score = 40;
				break;
			case "PrivateTenantFurnished":
				score = 26;
				break;
			case "PrivateTenantUnfurnished":
				score = 34;
				break;
			case "CouncilTenant":
				score = 10;
				break;
			case "Cohabiting":
				score = 34;
				break;
			case "LivingWithParents":
				score = 10;
				break;
			default:
				score = 10;
				break;
			}
		} catch (NullPointerException e) {
			score = 10;
		}
		
		return score;

	}
	
	
}
