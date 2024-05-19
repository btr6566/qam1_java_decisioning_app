package com.applyProject;

import java.util.Random;

import com.applyProject.data.AzureJDBC;
import com.applyProject.data.UserInput;
import com.applyProject.programData.Applicant;
import com.applyProject.programData.CaseData;
import com.applyProject.programData.DecisioningDataRow;
import com.applyProject.scorecards.Challanger;
import com.applyProject.scorecards.Champion;
import com.applyProject.scorecards.NumericCharacteristic;
import com.applyProject.scorecards.Scorecard;
import com.applyProject.scorecards.StringCharacteristic;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;




public class Main {

	////////////////////////////////////////////////
	// MAIN
	////////////////////////////////////////////////
	
	//This supress warnings is used because the scorecard characteristics are technically not used
	
	@SuppressWarnings("unused")
	public static void main(String[] args) {

		////////////////////////////////////////////////
		// Set Up
		////////////////////////////////////////////////
		
		//Load setup parameter file
		SetUp.loadSetUpProperties();
		
		CaseData caseData = new CaseData();
		
		//Using GSON to get a representation of an object easily
		GsonBuilder builder = new GsonBuilder(); 
		Gson gson = builder.create();
		
		//Struggling to deal with closing the scanner, as any later need for it creates a Runtime Exception.
		// surrounding with TRY doesn't fix
		// Working around by passing a Scanner into a relevant method, then closing at the end of program once sure no longer needed
		
		
		//final - idea is this class creates an input stream & has a close method, so don't want to re-assign
		final UserInput userInput = new UserInput();
		
		
		//-------------
		//Database
		//-------------
		
		//Create a Database connection Object. test Connection & CRUD operations should be methods of this
		// For this I've set up an Integration User with only permissions the application needs
		AzureJDBC db = new AzureJDBC(
			SetUp.jdbcUser
			,SetUp.jdbcPwd
		);
		
		
		//Test Connection, prints StackTrace if Errors
		System.out.println("==========================================================");
		System.out.println("== Azure Database Connection Check");
		System.out.println("==========================================================");
		
		
		//Problem with Azure DB is the suspended state it goes into to save cost. Need a method to send a "wake up" signal
		db.wakeUpAzureDb();
//		db.getTest();
		
		System.out.println("==========================================================");


		
		////////////////////////////////////////////////
		// Input Form
		////////////////////////////////////////////////
		
	
		//-------------
		//Prompt for User Data
		//-------------
		
		// Create an Applicant Object to store data on them
		// An Object is handy if this expands to allow Joint applicants (i.e. could have more then 1).
		Applicant appl1 = new Applicant();
		caseData.setAppl(appl1);
		
		
		//Basic applicant details
		System.out.println("======================");
		System.out.println("= Your Details");
		System.out.println("======================");
		String fornameInput = userInput.getStringInput("Please enter your First Name: ");
		String surnameInput = userInput.getStringInput("Please enter your Surname: ");
		
		//Prompt applicant for Statuses. Complex to offloaded to methods out of main
		userInput.residentialStatusPrompt(appl1);
		userInput.employmentStatusPrompt(appl1);
		
	
		//Add to applicant Object
		appl1.setForename(fornameInput);
		appl1.setSurname(surnameInput);
//		appl1.setDobString("");
		
		////////////////////////////////////////////////
		// Retrieve External Data for Decisioning
		////////////////////////////////////////////////
	
		//https://stackoverflow.com/questions/5271598/java-generate-random-number-between-two-given-values
		
		//So don't have to build a match logic (which isn't a beginner job), use a random number for external data
		Random r = new Random();
		int low = SetUp.minId;
		int high = SetUp.maxId;
		int randomid = r.nextInt(high-low) + low;
		System.out.printf("RandomId = %d\n",randomid);
		
		//This forms the basis of what holds the data needed for Scorecards & Policy
		DecisioningDataRow decData = db.getDecisionData(randomid);
		caseData.setDecData(decData);
		
		////////////////////////////////////////////////
		// Scorecards
		////////////////////////////////////////////////
		

		
		
		//Idea is to calculate both, regardless of final one used
		// This is useful for MI when comparing the strategies
		
		//-------------
		//Calculate Champion Scorecard
		//-------------
		
		//Use Constructor to set Base/Starting score
		Scorecard championSc = new Scorecard("ChampionScorecard",600);
		caseData.addScorecard(championSc);
		
		
		
		//add characteristic E1B07, Must be a cleaner way of doing this...
//		StringCharacteristic championE1B07 = new StringCharacteristic("E1B07",decData.getE1B07());
//		championE1B07.setBandingScore(Champion.champion_E1B07_score(championE1B07.getCharacteristicValue()));
//		championSc.addCharacteristic(championE1B07);
		
		
//		Plan B - Use a Constructor that includes Scorecard, but instead of saving as a property to the Scorecard, use the constructor to call the add method
//		Works, but still need the Set Band setter method. This will do untill can code review the Class design
		StringCharacteristic championE1B07 = new StringCharacteristic(
					"E1B07",
					decData.getE1B07()
					,championSc
					,Champion.e1b07_score(decData.getE1B07())
					);
//		championE1B07.setBandingScore(Champion.champion_E1B07_score(championE1B07.getCharacteristicValue()));
		
		
		NumericCharacteristic championE1B09 = new NumericCharacteristic(
				"E1B09",
				decData.getE1B09()
				,championSc
				,Champion.e1b09_score(decData.getE1B09())
				);
//		championE1B09.setBandingScore(Champion.champion_E1B09_score(championE1B09.getCharacteristicValue()));
		
		
		NumericCharacteristic championTRDA13 = new NumericCharacteristic(
				"TRD-A-13"
				,decData.getTRD_A_13()
				,championSc
				,Champion.trda13_score(decData.getTRD_A_13())
				);
//		championTRDA13.setBandingScore(Champion.champion_TRDA13_score(championTRDA13.getCharacteristicValue()));
		
		
		NumericCharacteristic championE1A09 = new NumericCharacteristic(
				"E1A09"
				,decData.getE1A09()
				,championSc
				,Champion.e1a09_score(decData.getE1A09())
				);
//		championE1A09.setBandingScore(Champion.champion_E1A09_score(championE1A09.getCharacteristicValue()));
		
		NumericCharacteristic championTRDSTL14 = new NumericCharacteristic(
				"TRDSTL14"
				,decData.getTRD_STL_14()
				,championSc
				,Champion.e1a09_score(decData.getTRD_STL_14())
				);
//		championTRDSTL14.setBandingScore(Champion.champion_E1A09_score(championTRDSTL14.getCharacteristicValue()));
		
		
		//The eNum ones require using toString to be compatible, Room for improvement
		StringCharacteristic championResStatus = new StringCharacteristic(
				"ResidentialStatus",
				appl1.getResidentialStatus().toString()
				,championSc
				,Champion.residentialStatus_score(appl1.getResidentialStatus().toString())
				);
//		championResStatus.setBandingScore(Champion.champion_ResidentialStatus_score(championResStatus.getCharacteristicValue()));
		
		
		championSc.calculateProbofDefault();
		
		//-------------
		//Calculate Challanger Scorecard
		//-------------
		
		//Use Constructor to set Base/Starting score
		Scorecard challangerSc = new Scorecard("ChallangerScorecard",580);		
		caseData.addScorecard(challangerSc);
		
		
		NumericCharacteristic challangerNDSPCII = new NumericCharacteristic(
				"NDSPCII"
				,decData.getNDSPCII()
				,challangerSc
				,Challanger.ndspcii_score(decData.getNDSPCII())
				);
//		challangerNDSPCII.setBandingScore(Challanger.challanger_NDSPCII_score(challangerNDSPCII.getCharacteristicValue()));
		
		
		NumericCharacteristic challangerTRDA06 = new NumericCharacteristic(
				"TRD-A-06"
				,decData.getTRD_A_06()
				,challangerSc
				,Challanger.trda06_score(decData.getTRD_A_06())
				);
//		challangerTRDA06.setBandingScore(Challanger.challanger_TRD_A_06_score(challangerTRDA06.getCharacteristicValue()));
		
		NumericCharacteristic challangerE1B13 = new NumericCharacteristic(
				"E1B13"
				,decData.getE1B13()
				,challangerSc
				,Challanger.e1b13_score(decData.getE1B13())
				);
//		challangerE1B13.setBandingScore(Challanger.challanger_E1B13_score(challangerE1B13.getCharacteristicValue()));
		
		
		NumericCharacteristic challangerE1B01 = new NumericCharacteristic(
				"E1B01"
				,decData.getE1B01()
				,challangerSc
				,Challanger.e1b01_score(decData.getE1B01())
				);
		
		NumericCharacteristic challangerTRDSTL19 = new NumericCharacteristic(
				"TRD-STL-19"
				,decData.getTRD_STL_19()
				,challangerSc
				,Challanger.trdstl19_score(decData.getTRD_STL_19())
				);
		
		StringCharacteristic challangerEmploymentStatus = new StringCharacteristic(
				"EmploymentStatus"
				,appl1.getEmploymentStatus().toString()
				,challangerSc
				,Challanger.employmentStatus_score(appl1.getEmploymentStatus().toString())
				);
		
		challangerSc.calculateProbofDefault();
		
		////////////////////////////////////////////////
		// Policy
		////////////////////////////////////////////////
		
		
		// E1B08 Policy
		// DelphiScore Policy
		// Scorecard Decline
		
		
		//Existing Customer (Northwind) Policy
		
		
		//Accept
		
		////////////////////////////////////////////////
		// Shutdown
		////////////////////////////////////////////////
		userInput.closeUserInput();
		
		
		
		////////////////////////////////////////////////
		// Console Log for testing
		////////////////////////////////////////////////
		System.out.println(gson.toJson(caseData));
//		System.out.println(gson.toJson(appl1));
//		System.out.println(gson.toJson(decData));
//		System.out.println(gson.toJson(championSc));
//		System.out.println(gson.toJson(challangerSc));
	}
	
	
}







