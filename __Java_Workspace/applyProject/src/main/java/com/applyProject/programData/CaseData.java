package com.applyProject.programData;

import java.util.ArrayList;
import java.util.Random;

import com.applyProject.scorecards.Scorecard;

public class CaseData {
	
	////////////
	//Properties
	///////////
	
	//For now, only support 1 applicant
	Applicant appl;
	
	DecisioningDataRow decData;
	
	Integer scorecardRngResult;
	String strategyPath;
	
	ArrayList<Scorecard> scorecards;
	
	
	//////////////
	// Constructors
	//////////////	
	public CaseData() {
		super();
		
		scorecards = new ArrayList<>();
		
		//Generate a Random number, will need this later to decide which Path to use
		Random r = new Random();
		
		int scorecardRnglow = 1;
		int scorecardRnghigh = 100;
		
		scorecardRngResult = r.nextInt(scorecardRnghigh-scorecardRnglow) + scorecardRnglow;
//		System.out.printf("scorecardRngResult = %d\n",scorecardRngResult);
	
		//Set which strategy to follow upfront 
		if (scorecardRngResult <= 60) {
			strategyPath = "CHAMPION";
		} else {
			strategyPath = "CHALLANGER";
		}
	}
	
	//////////////
	// Getters and Setters
	//////////////
	public Applicant getAppl() {
		return appl;
	}

	public void setAppl(Applicant appl) {
		this.appl = appl;
	}
	
	public Integer getScorecardRngResult() {
		return scorecardRngResult;
	}

	public String getStrategyPath() {
		return strategyPath;
	}
	public void setStrategyPath(String strategyPath) {
		this.strategyPath = strategyPath;
	}
	public DecisioningDataRow getDecData() {
		return decData;
	}
	public void setDecData(DecisioningDataRow decData) {
		this.decData = decData;
	}
	
	public void addScorecard(Scorecard scorecard) {
		scorecards.add(scorecard);
	}

	public ArrayList<Scorecard> getScorecards() {
		return scorecards;
	}
	
	public Scorecard getScorecardByIndex(int index) {
		
		Scorecard scorecard = scorecards.get(index);
		
		return scorecard;
	}

	public void setScorecards(ArrayList<Scorecard> scorecards) {
		this.scorecards = scorecards;
	}	
	

}
