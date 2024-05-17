package com.applyProject.data;

import java.io.FilterInputStream;
import java.util.Scanner;

import com.applyProject.programData.Applicant;

public final class UserInput {

	///
	//Properties
	///
	
	private Scanner scannerInput;
	
	
	///
	//Constructors
	///
	
	public UserInput() {
		
		//Rather then use System.in directly, use a wrapper:
		//https://stackoverflow.com/questions/27286690/in-java-is-it-possible-to-re-open-system-in-after-closing-it
		this.scannerInput = new Scanner(new FilterInputStream(System.in) {
			public void close() {
				
			}
		});
		
	}
	
	
	
	///////////////
	//Methods
	///////////////
	public void closeUserInput() {
		scannerInput.close();
		
		//Set In back to original System.in using backup made earlier
//		System.setIn(sysInBk);
	}
	
	
	//------
	//Get Value methods
	//--------
	public String getStringInput(String prompt) {
			
			//Print the Prompt
			System.out.println(prompt);
			
			//Read whatever was inputed into a String Object
			String userInput = scannerInput.nextLine();
		
			return userInput;	
	}

	
	public Integer getIntInput(String prompt) throws NumberFormatException {
		
			//Print the Prompt
			System.out.println(prompt);
			
			Integer userInput = Integer.parseInt(scannerInput.nextLine());
			
			System.out.println(userInput);
			
			return userInput;	
		

	}
	
	
	//------
	//Applicant prompts
	//--------
	
	public void residentialStatusPrompt(Applicant appl) {
		
		int loopCount = 0; //Infinite Loop failsafe

		//Assumption is if already have a residential status, want to overwrite. So NULL it for the while loop later
		appl.setResidentialStatus(null);
		
		//ResidentialStatus menu
		System.out.println("======================");
		System.out.println("= Residential Status");
		System.out.println("======================");
		System.out.println("1 = HomeOwner");
		System.out.println("2 = PrivateTenantFurnished");
		System.out.println("3 = PrivateTenantUnfurnished");
		System.out.println("4 = CouncilTenant");
		System.out.println("5 = Cohabiting");
		System.out.println("6 = LivingWithParents");

		//get the enum for the entered value (use a Switch Case)
		while (appl.getResidentialStatus() == null) {
			
			
			//Fail safe for possible Infinite Loop if logic errors OR repeated bad user input
			loopCount++;
			if (loopCount > 3) {
				System.out.printf("ERROR: Max Loop Count hit (count = %d)\n",loopCount);
				System.out.println("Terminating program");
				
				System.exit(1);
//				break;
			}
		
			try {
				Integer residentialStatusOption = getIntInput("Please enter an option from the above: ");
				
				switch(residentialStatusOption) {
				  case 1:
					  appl.setResidentialStatus(ResidentialStatus.HomeOwner);
					  break;
				  case 2:
					  appl.setResidentialStatus(ResidentialStatus.PrivateTenantFurnished);
					  break;
				  case 3:
					  appl.setResidentialStatus(ResidentialStatus.PrivateTenantUnfurnished);
					  break;
				  case 4:
					  appl.setResidentialStatus(ResidentialStatus.CouncilTenant);
					  break;
				  case 5:
					  appl.setResidentialStatus(ResidentialStatus.Cohabiting);
					  break;
				  case 6:
					  appl.setResidentialStatus(ResidentialStatus.LivingWithParents);
					  break;
				  default:
					  System.out.println("ERROR: Invalid Option. Input must be between 0-6");
				}
				
			} catch (NumberFormatException e) {
				System.out.println("ERROR: Invalid Option. Input must be between 0-6");
			} catch (Exception e) {
				e.printStackTrace();
				e.getMessage();
			}
			
			
		}
		
	}
	
	
	public void employmentStatusPrompt(Applicant appl) {
		
		int loopCount = 0;
		
		//Assumption is if already have a residential status, want to overwrite. So NULL it for the while loop later
		appl.setEmploymentStatus(null);
		
		//EmploymentStatus menu
		System.out.println("======================");
		System.out.println("= Employment Status");
		System.out.println("======================");
		System.out.println("1 = FullTime");
		System.out.println("2 = PartTime");
		System.out.println("3 = Student");
		System.out.println("4 = SelfEmployed");
		System.out.println("5 = Unemployed");
		System.out.println("6 = Retired");
		
		
//		employmentStatusLoop:
		while (appl.getEmploymentStatus() == null) {
			
			//Fail safe for possible Infinite Loop if logic errors OR repeated bad user input
			loopCount++;
			if (loopCount > 3) {
				System.out.printf("ERROR: Max Loop Count hit (count = %d)\n",loopCount);
				System.out.println("Terminating program");
				
				System.exit(1);
//				break;
			}
			
			
			try {
				Integer employmentStatusOption = getIntInput("Please enter an option from the above: ");
				
				switch(employmentStatusOption) {
				  case 1:
					  appl.setEmploymentStatus(EmploymentStatus.FullTime);
					  break;
				  case 2:
					  appl.setEmploymentStatus(EmploymentStatus.PartTime);
					  break;
				  case 3:
					  appl.setEmploymentStatus(EmploymentStatus.Student);
					  break;
				  case 4:
					  appl.setEmploymentStatus(EmploymentStatus.SelfEmployed);
					  break;
				  case 5:
					  appl.setEmploymentStatus(EmploymentStatus.Unemployed);
					  break;
				  case 6:
					  appl.setEmploymentStatus(EmploymentStatus.Retired);
					  break;
				  default:
					  System.out.println("ERROR: Invalid Option. Input must be between 0-6");
				}
				
				
			} catch (NumberFormatException e) {
				System.out.println("ERROR: Invalid Option. Input must be between 0-6");
			} catch (Exception e) {
				e.printStackTrace();
				e.getMessage();
			}
			
			
		}
		
		
	}
	
	
	
}
