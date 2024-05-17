package com.applyProject.programData;

public class DecisioningDataRow {
	
	public static int decisioningDataRowCount = 0;
	
	private Integer pk;
	
	private String E1B07;
	private String E1B08;
	
	private Integer E1B09;
	private Integer TRD_A_13;
	private Integer E1A09;
	private Integer E5S051;
	private Integer NDSPCII;
	private Integer TRD_A_06;
	private Integer E1B13;
	private Integer E1B01;
	private Integer TRD_STL_14;
	private Integer TRD_STL_19;
	
	////////////////
	// Constructors
	///////////////	
	public DecisioningDataRow() {
		super();
		decisioningDataRowCount++;
		
	}
	
	
	public DecisioningDataRow(Integer pk, String e1b07, Integer tRD_STL_14, String e1b08, Integer e1b09,
			Integer tRD_A_13, Integer e1a09, Integer e5s051, Integer nDSPCII, Integer tRD_A_06, Integer e1b13,
			Integer e1b01, Integer tRD_STL_19) {
		
		super();
		this.pk = pk;
		E1B07 = e1b07;
		TRD_STL_14 = tRD_STL_14;
		E1B08 = e1b08;
		E1B09 = e1b09;
		TRD_A_13 = tRD_A_13;
		E1A09 = e1a09;
		E5S051 = e5s051;
		NDSPCII = nDSPCII;
		TRD_A_06 = tRD_A_06;
		E1B13 = e1b13;
		E1B01 = e1b01;
		TRD_STL_19 = tRD_STL_19;
		
		
		decisioningDataRowCount++;
		
	}

	////////////////
	// Getters & Setters
	///////////////	

	public static int getDecisioningDataRowCount() {
		return decisioningDataRowCount;
	}


	public static void setDecisioningDataRowCount(int decisioningDataRowCount) {
		DecisioningDataRow.decisioningDataRowCount = decisioningDataRowCount;
	}


	public Integer getPk() {
		return pk;
	}


	public void setPk(Integer pk) {
		this.pk = pk;
	}


	public String getE1B07() {
		return E1B07;
	}


	public void setE1B07(String e1b07) {
		E1B07 = e1b07;
	}


	public Integer getTRD_STL_14() {
		return TRD_STL_14;
	}


	public void setTRD_STL_14(Integer tRD_STL_14) {
		TRD_STL_14 = tRD_STL_14;
	}


	public String getE1B08() {
		return E1B08;
	}


	public void setE1B08(String e1b08) {
		E1B08 = e1b08;
	}


	public Integer getE1B09() {
		return E1B09;
	}


	public void setE1B09(Integer e1b09) {
		E1B09 = e1b09;
	}


	public Integer getTRD_A_13() {
		return TRD_A_13;
	}


	public void setTRD_A_13(Integer tRD_A_13) {
		TRD_A_13 = tRD_A_13;
	}


	public Integer getE1A09() {
		return E1A09;
	}


	public void setE1A09(Integer e1a09) {
		E1A09 = e1a09;
	}


	public Integer getE5S051() {
		return E5S051;
	}


	public void setE5S051(Integer e5s051) {
		E5S051 = e5s051;
	}


	public Integer getNDSPCII() {
		return NDSPCII;
	}


	public void setNDSPCII(Integer nDSPCII) {
		NDSPCII = nDSPCII;
	}


	public Integer getTRD_A_06() {
		return TRD_A_06;
	}


	public void setTRD_A_06(Integer tRD_A_06) {
		TRD_A_06 = tRD_A_06;
	}


	public Integer getE1B13() {
		return E1B13;
	}


	public void setE1B13(Integer e1b13) {
		E1B13 = e1b13;
	}


	public Integer getE1B01() {
		return E1B01;
	}


	public void setE1B01(Integer e1b01) {
		E1B01 = e1b01;
	}


	public Integer getTRD_STL_19() {
		return TRD_STL_19;
	}


	public void setTRD_STL_19(Integer tRD_STL_19) {
		TRD_STL_19 = tRD_STL_19;
	}
	
	
	
	
	
	


}
