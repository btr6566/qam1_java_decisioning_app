package com.applyProject;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class SetUpTest {

	@Test
	void loadSetUpProperties() {
		
		SetUp.loadSetUpProperties();
		
		assertEquals(SetUp.jdbcUser, "jdbc_integration_user@btrqasdlvl4");
		assertNotNull(SetUp.jdbcPwd);
		assertEquals(SetUp.minId, 1);
		assertEquals(SetUp.maxId, 10000);
		
		
	}

}
