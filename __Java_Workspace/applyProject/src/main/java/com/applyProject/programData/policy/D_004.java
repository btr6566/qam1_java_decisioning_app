package com.applyProject.programData.policy;

import com.applyProject.enums.*;
import com.applyProject.programData.AppData;
import com.applyProject.programData.scorecards.Scorecard;

public final class D_004 extends PolicyRule {

	/////////////
	//Properties set up
	/////////////
	public D_004() {
		super();
		setPolicyCode(PolicyCodes.D_004);
		setDecisionType(Decision.DECLINE);
	}
	
	/////////////
	//Methods
	/////////////
	
//	@Override
	public void ruleOutcome(AppData data) {

		EmploymentStatus appl1EmployStatus = data.getAppl().getEmploymentStatus();
		
		boolean failTrigger = false;
		
		if (appl1EmployStatus == EmploymentStatus.Unemployed) {
			failTrigger = true;
		}
		

		setRuleOutcome(failTrigger);

	}

}
