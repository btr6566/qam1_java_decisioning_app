package com.applyProject.programData.policy;

import com.applyProject.enums.Decision;
import com.applyProject.enums.PolicyCodes;
import com.applyProject.enums.Results;
import com.applyProject.programData.AppData;
//import com.applyProject.programData.DecisioningDataRow;

//Thought about using an Interface for this, but abstract class allows Properties I want to enforce

public abstract class PolicyRule {
	
	protected PolicyCodes policyCode;
	protected Results ruleOutcome;
	protected Decision decisionType;
	
	
	public PolicyCodes getPolicyCode() {
		return policyCode;
	}


	public void setPolicyCode(PolicyCodes policyCode) {
		this.policyCode = policyCode;
	}


	public Decision getDecisionType() {
		return decisionType;
	}


	public void setDecisionType(Decision decisionType) {
		this.decisionType = decisionType;
	}
	
	public Results getRuleOutcome() {
		return ruleOutcome;
	}


	// Idea was to use this RuleOutome as a manditory method to implement
	// but depends on all policy rules using a Common Data Object
	// In hindsight, could have made a base class that could be extended, but this works too
	abstract void ruleOutcome(AppData data);
	
	
	// Simplfies the logic needed for ruleOutcome()
	protected void setRuleOutcome(Boolean failTrigger) {
		
		try {

			this.ruleOutcome = (failTrigger) ? Results.FAIL : Results.PASS;

		} catch (NullPointerException e) {
			this.ruleOutcome = Results.UNKNOWN;
			e.getMessage();
			e.printStackTrace();
		}
	}
	
	
}
