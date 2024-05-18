package com.applyProject.policy;



//Thought about using an Interface for this, but abstract class allows Properties I want to enforce
public abstract class PolicyAbstract {
	
	Results ruleOutcome;
	Decision decisionType;
	
	
	abstract void setDecision();
	
}
