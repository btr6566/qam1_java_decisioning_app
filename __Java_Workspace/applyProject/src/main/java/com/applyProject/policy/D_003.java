package com.applyProject.policy;

import com.applyProject.enums.Decision;
import com.applyProject.enums.PolicyCodes;
import com.applyProject.programData.AppData;
//import com.applyProject.programData.DecisioningDataRow;
import com.applyProject.scorecards.Scorecard;

public final class D_003 extends PolicyRule {

	/////////////
	//Properties set up
	/////////////
	public D_003() {
		super();
		setPolicyCode(PolicyCodes.D_003);
		setDecisionType(Decision.DECLINE);
	}
	
	/////////////
	//Methods
	/////////////
	
//	@Override
	public void ruleOutcome(AppData data) {

		Scorecard champion = data.getScorecardByIndex(0);
		Scorecard challanger = data.getScorecardByIndex(1);
		
		int championScore = champion.getScore();
		int challangerScore = challanger.getScore();
		
		if (championScore <= 600) {
			
		} else if (challangerScore <= 600) {

		}
		
		
		boolean result = false;
		
		setRuleOutcome(result);

	}

}
