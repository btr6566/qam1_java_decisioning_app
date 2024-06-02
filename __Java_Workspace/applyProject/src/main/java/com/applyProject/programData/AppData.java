package com.applyProject.programData;

import java.util.ArrayList;
import java.util.Random;

import com.applyProject.enums.Decision;
import com.applyProject.enums.StrategyPath;
import com.applyProject.programData.offers.Offers;
import com.applyProject.programData.policy.PolicyRule;
import com.applyProject.programData.scorecards.Scorecard;

public class AppData {
	
	////////////
	//Properties
	///////////
	
	//For now, only support 1 applicant
	protected Applicant appl;
	
	protected DecisioningDataRow decData;
	
	protected Integer scorecardRngResult;
	protected StrategyPath strategyPath;
	protected Decision finalDecision;
	
	protected Offers offer;
	
	protected ArrayList<Scorecard> scorecards;
	
	protected ArrayList<PolicyRule> flags;
	
	
	//////////////
	// Constructors
	//////////////	
	public AppData() {
		super();
		
		scorecards = new ArrayList<>();
		flags = new ArrayList<>();
		
		//Generate a Random number, will need this later to decide which Path to use
		Random r = new Random();
		
		int scorecardRnglow = 1;
		int scorecardRnghigh = 100;
		
		scorecardRngResult = r.nextInt(scorecardRnghigh-scorecardRnglow) + scorecardRnglow;
//		System.out.printf("scorecardRngResult = %d\n",scorecardRngResult);
	
		//Set which strategy to follow upfront 
		if (scorecardRngResult <= 60) {
			strategyPath = StrategyPath.CHAMPION;
		} else {
			strategyPath = StrategyPath.CHALLANGER;
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

	public StrategyPath getStrategyPath() {
		return strategyPath;
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
	
	public void addFlag(PolicyRule rule) {
		
		flags.add(rule);
		
	}
	
	public ArrayList<PolicyRule> getFlags() {
		return flags;
	}

	public Offers getOffer() {
		return offer;
	}

	public void setOffer(Offers offer) {
		this.offer = offer;
	}

	public Decision getFinalDecision() {
		return finalDecision;
	}

	public void setFinalDecision(Decision finalDecision) {
		this.finalDecision = finalDecision;
	}
	
	

	
}
