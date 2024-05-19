package com.applyProject.policy;

import com.applyProject.enums.Decision;
import com.applyProject.enums.PolicyCodes;
import com.applyProject.programData.AppData;

public final class D_002 extends PolicyRule {


	/////////////
	//Properties set up
	/////////////
	public D_002() {
		super();
		setPolicyCode(PolicyCodes.D_002);
		setDecisionType(Decision.DECLINE);
	}
	
	
	/////////////
	//Methods
	/////////////
	
//	@Override
	public void ruleOutcome(AppData data) {

		Integer getE5S051 = data.getDecData().getE5S051();
		
		boolean result = (getE5S051 < 600) ? true : false;
		
		setRuleOutcome(result);

	}

}
