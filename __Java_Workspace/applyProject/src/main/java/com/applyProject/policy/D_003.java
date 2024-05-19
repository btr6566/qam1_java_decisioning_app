package com.applyProject.policy;

import com.applyProject.policy.enums.Decision;
import com.applyProject.policy.enums.PolicyCodes;
import com.applyProject.programData.CaseData;
//import com.applyProject.programData.DecisioningDataRow;
import com.applyProject.scorecards.Scorecard;

public final class D_003 extends PolicyRule {

	/////////////
	//Properties set up
	/////////////
	PolicyCodes policyCode = PolicyCodes.D_003;
	Decision decisionType = Decision.DECLINE;
	
	
	/////////////
	//Methods
	/////////////
	
//	@Override
	void ruleOutcome(CaseData data) {

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
