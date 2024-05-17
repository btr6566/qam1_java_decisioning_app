package com.applyProject;

import com.google.gson.Gson; 
import com.google.gson.GsonBuilder;  

import com.applyProject.data.AzureJDBC;
import com.applyProject.data.UserInput;
import com.applyProject.programData.Applicant;

import com.applyProject.programData.DecisioningDataRow;
import com.applyProject.scorecards.Scorecard;
import com.applyProject.scorecards.Challanger;
import com.applyProject.scorecards.Champion;
import com.applyProject.scorecards.StringCharacteristic;
import com.applyProject.scorecards.NumericCharacteristic;




public class Main {

	////////////////////////////////////////////////
	// MAIN
	////////////////////////////////////////////////
	public static void main(String[] args) {

		////////////////////////////////////////////////
		// Set Up
		////////////////////////////////////////////////
		
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
			"jdbc_integration_user@btrqasdlvl4"
			,"tCL8s0&s£2q3" //Look into how to hide this, shouldn't be hard-coded into the program
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
		
		
		//Test with static value
		DecisioningDataRow decData = db.getDecisionData(1);
		
		
		////////////////////////////////////////////////
		// Scorecards
		////////////////////////////////////////////////
		
		//Idea is to calculate both, regardless of final one used
		// This is useful for MI when comparing the strategies
		
		//-------------
		//Calculate Champion Scorecard
		//-------------
		Scorecard championSc = new Scorecard("ChampionScorecard");
		
		//For Base Score, just use the Setter method
		championSc.setScore(600);
		
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
					);
		championE1B07.setBandingScore(Champion.champion_E1B07_score(championE1B07.getCharacteristicValue()));
		
		
		NumericCharacteristic championE1B09 = new NumericCharacteristic(
				"E1B09",
				decData.getE1B09()
				,championSc
				);
		championE1B09.setBandingScore(Champion.champion_E1B09_score(championE1B09.getCharacteristicValue()));
		
		
		NumericCharacteristic championTRDA13 = new NumericCharacteristic(
				"TRD-A-13",
				decData.getTRD_A_13()
				,championSc
				);
		championTRDA13.setBandingScore(Champion.champion_TRDA13_score(championTRDA13.getCharacteristicValue()));
		
		
		NumericCharacteristic championE1A09 = new NumericCharacteristic(
				"E1A09",
				decData.getE1A09()
				,championSc
				);
		championE1A09.setBandingScore(Champion.champion_E1A09_score(championE1A09.getCharacteristicValue()));
		
		NumericCharacteristic championTRDSTL14 = new NumericCharacteristic(
				"TRDSTL14",
				decData.getTRD_STL_14()
				,championSc
				);
		championTRDSTL14.setBandingScore(Champion.champion_E1A09_score(championTRDSTL14.getCharacteristicValue()));
		
		
		//The eNum ones require using toString to be compatible, Room for improvement
		StringCharacteristic championResStatus = new StringCharacteristic(
				"ResidentialStatus",
				appl1.getResidentialStatus().toString()
				,championSc
				);
		championResStatus.setBandingScore(Champion.champion_ResidentialStatus_score(championResStatus.getCharacteristicValue()));
		
		
		//-------------
		//Calculate Challanger Scorecard
		//-------------
		Scorecard challangerSc = new Scorecard("ChallangerScorecard");
		
		//For Base Score, just use the Setter method
		challangerSc.setScore(580);
		
		
		NumericCharacteristic challangerNDSPCII = new NumericCharacteristic(
				"NDSPCII",
				decData.getNDSPCII()
				,challangerSc
				);
		challangerNDSPCII.setBandingScore(Challanger.challanger_NDSPCII_score(challangerNDSPCII.getCharacteristicValue()));
		
		
		NumericCharacteristic challangerTRDA06 = new NumericCharacteristic(
				"TRD-A-06",
				decData.getTRD_A_06()
				,challangerSc
				);
		challangerTRDA06.setBandingScore(Challanger.challanger_TRD_A_06_score(challangerTRDA06.getCharacteristicValue()));
		
		NumericCharacteristic challangerE1B13 = new NumericCharacteristic(
				"E1B13",
				decData.getE1B13()
				,challangerSc
				);
		challangerE1B13.setBandingScore(Challanger.challanger_E1B13_score(challangerE1B13.getCharacteristicValue()));
		
		
		
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
		System.out.println(gson.toJson(appl1));
		System.out.println(gson.toJson(decData));
		System.out.println(gson.toJson(championSc));
		System.out.println(gson.toJson(challangerSc));
	}
	
	
}







