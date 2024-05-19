package com.applyProject.policy;

import com.applyProject.enums.Decision;
import com.applyProject.enums.PolicyCodes;
import com.applyProject.programData.CaseData;

public final class D_002 extends PolicyRule {

	/////////////
	//Properties set up
	/////////////
	PolicyCodes policyCode = PolicyCodes.D_002;
	Decision decisionType = Decision.DECLINE;
	
	
	/////////////
	//Methods
	/////////////
	
//	@Override
	void ruleOutcome(CaseData data) {

		Integer getE5S051 = data.getDecData().getE5S051();
		
		boolean result = (getE5S051 < 600) ? true : false;
		
		setRuleOutcome(result);

	}

}
