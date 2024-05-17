package com.applyProject.programData;

import java.util.Date;

import com.applyProject.data.EmploymentStatus;
import com.applyProject.data.ResidentialStatus;

public class Applicant {
	
	
	//////////////////
	// Class Properties
	/////////////////
	
	String forename;
	String surname;
	String dobString;
	EmploymentStatus employmentStatus;
	ResidentialStatus residentialStatus;

	Date dobISOFormat;

	//////////////////
	// Constructors
	/////////////////

	//Basic Constructor
	public Applicant() {
		super(); //realise this super() isn't essential as Java implicitly assumes it, but I like to leave it. I prefer being explicit if possible
	}


	//One with all Input data
	public Applicant(String forename, String surname, String dobString, EmploymentStatus employmentStatus,
			ResidentialStatus residentialStatus) {
		super();
		
		//for this.x , same as Super(). Isn't strictly necessary but is a personal preference to leave it in
		this.forename = forename;
		this.surname = surname;
		this.dobString = dobString;
		this.employmentStatus = employmentStatus;
		this.residentialStatus = residentialStatus;
	}



	
	//////////////////
	// Getters & Setters
	/////////////////
	public String getForename() {
		return forename;
	}


	public void setForename(String forename) {
		this.forename = forename;
	}


	public String getSurname() {
		return surname;
	}


	public void setSurname(String surname) {
		this.surname = surname;
	}


	public String getDobString() {
		return dobString;
	}


	public void setDobString(String dobString) {
		this.dobString = dobString;
	}


	public EmploymentStatus getEmploymentStatus() {
		return employmentStatus;
	}


	public void setEmploymentStatus(EmploymentStatus employmentStatus) {
		this.employmentStatus = employmentStatus;
	}


	public ResidentialStatus getResidentialStatus() {
		return residentialStatus;
	}


	public void setResidentialStatus(ResidentialStatus residentialStatus) {
		this.residentialStatus = residentialStatus;
	}	
	
	
	//GSON has a toJSON method that does what I'm trying to do here. Using that instead
//	@Override
//	public String toString() {
//		
//		String out = "{"
//				+ "\"forename\": \"%s\","
//				+ "\"surname\": \"%s\""
//				+ "}".formatted(
//						this.getForename(),
//						this.getSurname()
//						);
//		
//		return out;
//		
//	};
	
}
