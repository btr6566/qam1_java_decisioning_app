package com.applyProject.policy;

import com.applyProject.enums.*;
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

		Scorecard sc = null;
		boolean result = false;
		
		switch (data.getStrategyPath()) {
		case CHAMPION:
			sc = data.getScorecardByIndex(0);

			result = (sc.getScore() <= 600)? true : false;
			
			break;
		case CHALLANGER:
			sc = data.getScorecardByIndex(1);
			result = (sc.getScore() <= 580)? true : false;
			break;
		}

		setRuleOutcome(result);

	}

}
