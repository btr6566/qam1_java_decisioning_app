package com.applyProject.policy;

import com.applyProject.enums.*;
import com.applyProject.programData.AppData;

public final class A_001 extends PolicyRule {

	/////////////
	//Properties set up
	/////////////
	public A_001() {
		super();
		setPolicyCode(PolicyCodes.A_001);
		setDecisionType(Decision.ACCEPT);
	}
	
	/////////////
	//Methods
	/////////////
	
//	@Override
	public void ruleOutcome(AppData data) {

		int declineRules = 0;
		int referRules = 0;
		
		data.getFlags();
		
		for (PolicyRule policyRule : data.getFlags()) {
			
			Decision decisionType = policyRule.getDecisionType();
			Results ruleOutcome = policyRule.getRuleOutcome();
			
//			System.out.println("decisionType="+decisionType);
//			System.out.println("ruleOutcome="+ruleOutcome);
			
			if (ruleOutcome == Results.FAIL) {

				switch (decisionType) {
				case DECLINE:
					declineRules++;
					break;
				case REFER:
					referRules++;
					break;
				default:
					break;
				}
				
			}
			
		}
		
		//setRuleOutcome() expects TRUE to indicate a negative outcome
		//need to do the reverse for Accepts
		boolean result = (declineRules == 0 && referRules == 0 )? false : true;

//		System.out.println("result="+result);
		setRuleOutcome(result);

	}

}
