package com.applyProject.policy;


import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.applyProject.policy.enums.Decision;
import com.applyProject.policy.enums.PolicyCodes;
import com.applyProject.programData.CaseData;

public final class D_001 extends PolicyRule {

	/////////////
	//Properties set up
	/////////////
	PolicyCodes policyCode = PolicyCodes.D_001;
	Decision decisionType = Decision.DECLINE;
	
	
	/////////////
	//Methods
	/////////////
//	@Override
	public void ruleOutcome(CaseData data) {
	
		String E1B08 = data.getDecData().getE1B08();
		
		//Use Regex
		//https://www.w3schools.com/java/java_regex.asp
		
		Pattern pattern = Pattern.compile("2|3|4|5|6|8", Pattern.CASE_INSENSITIVE);
	    Matcher matcher = pattern.matcher(E1B08);
	    boolean matchFound = matcher.find();
		
	    setRuleOutcome(matchFound);
	    
//		if (matchFound) {
//			this.ruleOutcome = Results.Fail;
//		} else {
//			this.ruleOutcome = Results.Pass;
//		}
		
	}

}
