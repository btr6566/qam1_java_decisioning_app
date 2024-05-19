package com.applyProject.policy;

import com.applyProject.enums.Decision;
import com.applyProject.enums.PolicyCodes;
import com.applyProject.enums.Results;
import com.applyProject.programData.CaseData;
//import com.applyProject.programData.DecisioningDataRow;

//Thought about using an Interface for this, but abstract class allows Properties I want to enforce

public abstract class PolicyRule {
	
	PolicyCodes policyCode;
	Results ruleOutcome;
	Decision decisionType;
	
	
	// Idea was to use this RuleOutome as a manditory method to implement
	// but depends on all policy rules using a Common Data Object
	// In hindsight, could have made a base class that could be extended, but this works too
	abstract void ruleOutcome(CaseData data);
	
	
	// Simplfies the logic needed for ruleOutcome()
	protected void setRuleOutcome(Boolean failTrigger) {
		
		try {
			if (failTrigger) {
				this.ruleOutcome = Results.FAIL;
			} else {
				this.ruleOutcome = Results.PASS;
			}
		} catch (NullPointerException e) {
			this.ruleOutcome = Results.UNKNOWN;
			e.printStackTrace();
		}
	}
	
	
}
