/*******************************************************************************************************!
!																	 									!
!	Name:	Delphi.VW_DelphiPremiumValueData.SQL		 				 							!
!																	 									!
!	Type:	T-SQL Script											 									!
!																	 									!
!	Purpose: Extract Premium Value data from Zoot (Full DelphiSelect Response)							!
!																	 									!
!																	 									!
!																										!
!=======================================================================================================!
!																										!
! Version Notes																							!
!																										!
!=======================================================================================================!
! Version !	Changed By !   Date      !			Comments			 									!
!=========!============!=============!==================================================================!
!	0.1   !	   BTR	   ! 2021-09-01	 ! 	Recycled from HC												!
!																										!
!*******************************************************************************************************/



/*
Transformations/Differences from RAW JSON block
-------------------------------
	*	'-' characters in variable names are replaced with '_' characters (complies to standard SQL)
	*	Names are padded with what Block they are sourced from, due to variable names being reused in different blocks


Notes
-----
	* Using LAX JSON paths (the default), so if a value is NULL, the entire thing does not error (values are not necessarially expected)
	* only valid JSON values are used, using the ISJSON function

*/

DROP VIEW [Delphi].[VW_DelphiPremiumValueData];
GO


CREATE VIEW [Delphi].[VW_DelphiPremiumValueData] WITH SCHEMABINDING AS 
SELECT
	 sbd.__PK
	,sbd.[ID]
	-- ,JSON.*
	,JSON.APACSCCBehavrlData_CCDATASUPPLIED		
	,JSON.APACSCCBehavrlData_CLUCLIL6M			
	,JSON.APACSCCBehavrlData_CLUCLIL6MNPRL6M		
	,JSON.APACSCCBehavrlData_CLUNPRL1M			
	,JSON.APACSCCBehavrlData_NOASBNPRL1M			
	,JSON.APACSCCBehavrlData_NOCAL1M				
	,JSON.APACSCCBehavrlData_NOCAL3M				
	,JSON.APACSCCBehavrlData_NOCLDL3M			
	,JSON.APACSCCBehavrlData_NOMLVCAL1M			
	,JSON.APACSCCBehavrlData_NOMLVCAL3M			
	,JSON.APACSCCBehavrlData_NOMPMNPRL3M			
	,JSON.APACSCCBehavrlData_PTBRL3MNPRL3M		
	,JSON.APACSCCBehavrlData_PTBRL6MNPRL6M		
	,JSON.APACSCCBehavrlData_PTSBRL3MNPRL3M		
	,JSON.APACSCCBehavrlData_PTSBRL6MNPRL6M		
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_01
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_02
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_03
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_04
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_05
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_06
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_07
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_08
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_09
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_10
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_11
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_12
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_13
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_14
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_15
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_16
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_17
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_18
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_19
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_20
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_21
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_22
	,JSON.EstimatedDisposableIncomeRAG_TRD_RAG_23
	,JSON.HighCostCredit_HCA01					
	,JSON.HighCostCredit_HCA02					
	,JSON.HighCostCredit_HCA03					
	,JSON.HighCostCredit_HCA04					
	,JSON.HighCostCredit_HCA05					
	,JSON.HighCostCredit_HCA06					
	,JSON.HighCostCredit_HCA07					
	,JSON.HighCostCredit_HCA08					
	,JSON.HighCostCredit_HCA09					
	,JSON.HighCostCredit_HCA10					
	,JSON.HighCostCredit_HCA11					
	,JSON.HighCostCredit_HCA12					
	,JSON.HighCostCredit_HCA13					
	,JSON.HighCostCredit_HCA14					
	,JSON.HighCostCredit_HCB01					
	,JSON.HighCostCredit_HCB02					
	,JSON.HighCostCredit_HCB03					
	,JSON.HighCostCredit_HCB04					
	,JSON.HighCostCredit_HCC01					
	,JSON.HighCostCredit_HCC02					
	,JSON.HighCostCredit_HCC03					
	,JSON.HighCostCredit_HCC04					
	,JSON.HighCostCredit_HCC05					
	,JSON.HighCostCredit_HCD01					
	,JSON.HighCostCredit_HCD02					
	,JSON.HighCostCredit_HCE01					
	,JSON.HighCostCredit_HCE02					
	,JSON.HighCostCredit_HCE03					
	,JSON.HighCostCredit_HCF01					
	,JSON.HighCostCredit_HCF02					
	,JSON.HighCostCredit_HCF03					
	,JSON.HighCostCredit_HCF04					
	,JSON.HighCostCredit_HCF05					
	,JSON.HighCostCredit_HCF06					
	,JSON.HighCostCredit_HCP01					
	,JSON.HighCostCredit_HCP02					
	,JSON.HighCostCredit_HCP03					
	,JSON.HighCostCredit_HCP04					
	,JSON.HighCostCredit_HCP05					
	,JSON.HighCostCredit_HCP06					
	,JSON.HighCostCredit_HCP07					
	,JSON.HighCostCredit_HCP08					
	,JSON.HighCostCredit_PDA01					
	,JSON.HighCostCredit_PDA02					
	,JSON.HighCostCredit_PDA03					
	,JSON.HighCostCredit_PDA04					
	,JSON.HighCostCredit_PDB05					
	,JSON.HighCostCredit_PDB06					
	,JSON.HighCostCredit_PDB07					
	,JSON.HighCostCredit_PDB08					
	,JSON.HighCostCredit_PDB09					
	,JSON.HighCostCredit_PDB10					
	,JSON.HighCostCredit_PDC11					
	,JSON.HighCostCredit_PDC12					
	,JSON.HighCostCredit_PDC13					
	,JSON.HighCostCredit_PDD14					
	,JSON.HighCostCredit_PDD15					
	,JSON.HighCostCredit_PDD16					
	,JSON.HighCostCredit_PDE17					
	,JSON.HighCostCredit_PDE18					
	,JSON.HighCostCredit_PDF19					
	,JSON.HighCostCredit_PDF20					
	,JSON.HighCostCredit_PDF21					
	,JSON.HighCostCredit_PDF22					
	,JSON.HighCostCredit_PDF23					
	,JSON.HighCostCredit_PDF24					
	,JSON.HighCostCredit_PDF25					
	,JSON.HighCostCredit_PDF26					
	,JSON.HighCostCredit_PDF27					
	,JSON.HighCostCredit_PDF28					
	,JSON.HighCostCredit_TRD_STL_01				
	,JSON.HighCostCredit_TRD_STL_02				
	,JSON.HighCostCredit_TRD_STL_03				
	,JSON.HighCostCredit_TRD_STL_04				
	,JSON.HighCostCredit_TRD_STL_05				
	,JSON.HighCostCredit_TRD_STL_06				
	,JSON.HighCostCredit_TRD_STL_07				
	,JSON.HighCostCredit_TRD_STL_08				
	,JSON.HighCostCredit_TRD_STL_09				
	,JSON.HighCostCredit_TRD_STL_10				
	,JSON.HighCostCredit_TRD_STL_11				
	,JSON.HighCostCredit_TRD_STL_12				
	,JSON.HighCostCredit_TRD_STL_13				
	,JSON.HighCostCredit_TRD_STL_14				
	,JSON.HighCostCredit_TRD_STL_15				
	,JSON.HighCostCredit_TRD_STL_16				
	,JSON.HighCostCredit_TRD_STL_17				
	,JSON.HighCostCredit_TRD_STL_18				
	,JSON.HighCostCredit_TRD_STL_19				
	,JSON.HighCostCredit_TRD_STL_20				
	,JSON.HighCostCredit_TRD_STL_21				
	,JSON.HighCostCredit_TRD_STL_22				
	,JSON.HighCostCredit_TRD_STL_23				
	,JSON.NeverPaidDefsBlock_SPABALEBADS			
	,JSON.NeverPaidDefsBlock_SPABALEBADSL12		
	,JSON.NeverPaidDefsBlock_SPABALNPD			
	,JSON.NeverPaidDefsBlock_SPABALNPDL12		
	,JSON.NeverPaidDefsBlock_SPAMTHFSTEBAD		
	,JSON.NeverPaidDefsBlock_SPANOEBADS			
	,JSON.NeverPaidDefsBlock_SPANOEBADSL12		
	,JSON.NeverPaidDefsBlock_SPANONPD			
	,JSON.NeverPaidDefsBlock_SPANONPDL12			
	,JSON.NeverPaidDefsBlock_SPATSMREBAD			
	,JSON.NeverPaidDefsBlock_SPATSMRNPD			
	,JSON.NeverPaidDefsBlock_SPBALEBADS			
	,JSON.NeverPaidDefsBlock_SPBALEBADSL12		
	,JSON.NeverPaidDefsBlock_SPBALNPD			
	,JSON.NeverPaidDefsBlock_SPBALNPDL12			
	,JSON.NeverPaidDefsBlock_SPMTHFSTEBAD		
	,JSON.NeverPaidDefsBlock_SPNOEBADS			
	,JSON.NeverPaidDefsBlock_SPNOEBADSL12		
	,JSON.NeverPaidDefsBlock_SPNONPD				
	,JSON.NeverPaidDefsBlock_SPNONPDL12			
	,JSON.NeverPaidDefsBlock_SPTSMREBAD			
	,JSON.NeverPaidDefsBlock_SPTSMRNPD			
	,JSON.TelecommsBlock_SPBALACTTEL				
	,JSON.TelecommsBlock_SPNOACTTEL				
	,JSON.TelecommsBlock_SPNODEL					
	,JSON.TelecommsBlock_SPNOINACTTEL36			
	,JSON.TelecommsBlock_SPNOINACTTELL12			
	,JSON.TelecommsBlock_SPNOINACTTELL24			
	,JSON.TelecommsBlock_SPTOTNOACTTEL			
	,JSON.TelecommsBlock_SPTOTNOSET				
	,JSON.TelecommsBlock_SPTOTNOSETL12			
	,JSON.TelecommsBlock_SPTOTNOSETL24			
	,JSON.TelecommsBlock_SPTOTNOSETL36			
	,JSON.TelecommsBlock_SPTSMRSETTEL			
	,JSON.TelecommsBlock_SPTSMRTEL				
	,JSON.TelecommsBlock_SPTSMRTELDEL			
	,JSON.TelecommsBlock_SPVALDEL				
	,JSON.TrendedData_TRD_A_01					
	,JSON.TrendedData_TRD_A_02					
	,JSON.TrendedData_TRD_A_03					
	,JSON.TrendedData_TRD_A_04					
	,JSON.TrendedData_TRD_A_05					
	,JSON.TrendedData_TRD_A_06					
	,JSON.TrendedData_TRD_A_07					
	,JSON.TrendedData_TRD_A_08					
	,JSON.TrendedData_TRD_A_09					
	,JSON.TrendedData_TRD_A_10					
	,JSON.TrendedData_TRD_A_11					
	,JSON.TrendedData_TRD_A_12					
	,JSON.TrendedData_TRD_A_13					
	,JSON.TrendedData_TRD_A_14					
	,JSON.TrendedData_TRD_A_15					
	,JSON.TrendedData_TRD_A_16					
	,JSON.TrendedData_TRD_A_17					
	,JSON.TrendedData_TRD_A_18					
	,JSON.TrendedData_TRD_A_19					
	,JSON.TrendedData_TRD_A_20					
	,JSON.TrendedData_TRD_A_21					
	,JSON.TrendedData_TRD_A_22					
	,JSON.TrendedData_TRD_A_23					
	,JSON.TrendedData_TRD_B_01					
	,JSON.TrendedData_TRD_B_02					
	,JSON.TrendedData_TRD_B_03					
	,JSON.TrendedData_TRD_B_04					
	,JSON.TrendedData_TRD_B_05					
	,JSON.TrendedData_TRD_B_06					
	,JSON.TrendedData_TRD_B_07					
	,JSON.TrendedData_TRD_B_08					
	,JSON.TrendedData_TRD_B_09					
	,JSON.TrendedData_TRD_B_10					
	,JSON.TrendedData_TRD_B_11					
	,JSON.TrendedData_TRD_B_12					
	,JSON.TrendedData_TRD_B_13					
	,JSON.TrendedData_TRD_B_14					
	,JSON.TrendedData_TRD_B_15					
	,JSON.TrendedData_TRD_B_16					
	,JSON.TrendedData_TRD_B_17					
	,JSON.TrendedData_TRD_B_18					
	,JSON.TrendedData_TRD_B_19					
	,JSON.TrendedData_TRD_B_20					
	,JSON.TrendedData_TRD_B_21					
	,JSON.TrendedData_TRD_B_22					
	,JSON.TrendedData_TRD_B_23					
	,JSON.TrendedData_TRD_B_24					
	,JSON.TrendedData_TRD_B_25					
	,JSON.TrendedData_TRD_B_26					
	,JSON.TrendedData_TRD_B_27					
	,JSON.TrendedData_TRD_B_28					
	,JSON.TrendedData_TRD_B_29					
	,JSON.TrendedData_TRD_B_30					
	,JSON.TrendedData_TRD_B_31					
	,JSON.TrendedData_TRD_B_32					
	,JSON.TrendedData_TRD_B_33					
	,JSON.TrendedData_TRD_B_34					
	,JSON.TrendedData_TRD_B_35					
	,JSON.TrendedData_TRD_B_36					
	,JSON.TrendedData_TRD_B_37					
	,JSON.TrendedData_TRD_B_38					
	,JSON.TrendedData_TRD_B_39					
	,JSON.TrendedData_TRD_B_40					
	,JSON.TrendedData_TRD_B_41					
	,JSON.TrendedData_TRD_B_42					
	,JSON.TrendedData_TRD_B_43					
	,JSON.TrendedData_TRD_B_44					
	,JSON.TrendedData_TRD_B_45					
	,JSON.TrendedData_TRD_B_46					
	,JSON.TrendedData_TRD_B_47					
	,JSON.TrendedData_TRD_B_48					
	,JSON.TrendedData_TRD_B_49					
	,JSON.TrendedData_TRD_B_50					
	,JSON.TrendedData_TRD_B_51					
	,JSON.TrendedData_TRD_B_52					
	,JSON.TrendedData_TRD_B_53					
	,JSON.TrendedData_TRD_C_01					
	,JSON.TrendedData_TRD_C_02					
	,JSON.TrendedData_TRD_C_03					
	,JSON.TrendedData_TRD_C_04					
	,JSON.TrendedData_TRD_C_05					
	,JSON.TrendedData_TRD_C_06					
	,JSON.TrendedData_TRD_C_07					
	,JSON.TrendedData_TRD_C_08					
	,JSON.TrendedData_TRD_C_09					
	,JSON.TrendedData_TRD_C_10					
	,JSON.TrendedData_TRD_C_11					
	,JSON.TrendedData_TRD_C_12					
	,JSON.TrendedData_TRD_C_13					
	,JSON.TrendedData_TRD_C_14					
	,JSON.TrendedData_TRD_C_15					
	,JSON.TrendedData_TRD_C_16					
	,JSON.TrendedData_TRD_C_17					
	,JSON.TrendedData_TRD_C_18					
	,JSON.TrendedData_TRD_O_01					
	,JSON.TrendedData_TRD_O_02					
	,JSON.TrendedData_TRD_O_03					
	,JSON.TrendedData_TRD_O_04					
	,JSON.TrendedData_TRD_O_05					
	,JSON.TrendedData_TRD_O_06					
	,JSON.TrendedData_TRD_O_07					
	,JSON.TrendedData_TRD_O_08					
	,JSON.TrendedData_TRD_O_09					
	,JSON.TrendedData_TRD_O_10					
	,JSON.TrendedData_TRD_O_11					
	,JSON.TrendedData_TRD_O_12					
	,JSON.TrendedData_TRD_O_13					
	,JSON.TrendedData_TRD_O_14					
	,JSON.TrendedData_TRD_O_15					
	,JSON.TrendedData_TRD_O_16					
	,JSON.TrendedData_TRD_P_01					
	,JSON.TrendedData_TRD_P_02					
	,JSON.TrendedData_TRD_P_03					
	,JSON.TrendedData_TRD_P_04					
	,JSON.TrendedData_TRD_P_05					
	,JSON.TrendedData_TRD_P_06					
	,JSON.TrendedData_TRD_P_07					
	,JSON.TrendedData_TRD_P_08					
	,JSON.TrendedData_TRD_P_09					
	,JSON.TrendedData_TRD_P_10					
	,JSON.TrendedData_TRD_P_11					
	,JSON.TrendedData_TRD_P_12					
	,JSON.TrendedData_TRD_P_13					
	,JSON.TrendedData_TRD_P_14					
	,JSON.TrendedData_TRD_P_15					
	,JSON.TrendedData_TRD_P_16					
	,JSON.TrendedData_TRD_P_17					
	,JSON.TrendedData_TRD_P_18					
	,JSON.TrendedData_TRD_P_19					
	,JSON.TrendedData_TRD_P_20					
	,JSON.TrendedData_TRD_P_21					
	,JSON.TrendedData_TRD_P_22					
	,JSON.TrendedData_TRD_P_23					
	,JSON.TrendedData_TRD_P_24					
	,JSON.TrendedData_TRD_P_25					
	,JSON.TrendedData_TRD_P_26					
	,JSON.TrendedData_TRD_P_27					
	,JSON.TrendedData_TRD_P_28					
	,JSON.TrendedData_TRD_P_29					
	,JSON.TrendedData_TRD_P_30					
	,JSON.TrendedData_TRD_P_31					
	,JSON.TrendedData_TRD_P_32					
	,JSON.TrendedData_TRD_P_33					
	,JSON.TrendedData_TRD_P_34					
	,JSON.TrendedData_TRD_P_35					
	,JSON.TrendedData_TRD_P_36					
	,JSON.TrendedData_TRD_P_37					
	,JSON.TrendedData_TRD_P_38					
	,JSON.TrendedData_TRD_P_39					
	,JSON.TrendedData_TRD_P_40					
	,JSON.TrendedData_TRD_S_01					
	,JSON.TrendedData_TRD_S_02					
	,JSON.Utilisationblock_SPA01					
	,JSON.Utilisationblock_SPA02					
	,JSON.Utilisationblock_SPA03					
	,JSON.Utilisationblock_SPA04					
	,JSON.Utilisationblock_SPA05					
	,JSON.Utilisationblock_SPA06					
	,JSON.Utilisationblock_SPA07					
	,JSON.Utilisationblock_SPA08					
	,JSON.Utilisationblock_SPA09					
	,JSON.Utilisationblock_SPA10					
	,JSON.Utilisationblock_SPAA01				
	,JSON.Utilisationblock_SPAA02				
	,JSON.Utilisationblock_SPAA03				
	,JSON.Utilisationblock_SPAA04				
	,JSON.Utilisationblock_SPAA05				
	,JSON.Utilisationblock_SPAA06				
	,JSON.Utilisationblock_SPAA07				
	,JSON.Utilisationblock_SPAA08				
	,JSON.Utilisationblock_SPAA09				
	,JSON.Utilisationblock_SPAA10				
	,JSON.Utilisationblock_SPAB111				
	,JSON.Utilisationblock_SPAB112				
	,JSON.Utilisationblock_SPAB113				
	,JSON.Utilisationblock_SPAB114				
	,JSON.Utilisationblock_SPAB115				
	,JSON.Utilisationblock_SPAB116				
	,JSON.Utilisationblock_SPAB117				
	,JSON.Utilisationblock_SPAB218				
	,JSON.Utilisationblock_SPAB219				
	,JSON.Utilisationblock_SPAB220				
	,JSON.Utilisationblock_SPAB221				
	,JSON.Utilisationblock_SPAB322				
	,JSON.Utilisationblock_SPAB323				
	,JSON.Utilisationblock_SPAC24				
	,JSON.Utilisationblock_SPACIICHECKDIGIT		
	,JSON.Utilisationblock_SPAD25				
	,JSON.Utilisationblock_SPAE126				
	,JSON.Utilisationblock_SPAE127				
	,JSON.Utilisationblock_SPAE128				
	,JSON.Utilisationblock_SPAF129				
	,JSON.Utilisationblock_SPAF130				
	,JSON.Utilisationblock_SPAF131				
	,JSON.Utilisationblock_SPAF232				
	,JSON.Utilisationblock_SPAF233				
	,JSON.Utilisationblock_SPAF334				
	,JSON.Utilisationblock_SPAF335				
	,JSON.Utilisationblock_SPAF336				
	,JSON.Utilisationblock_SPAG37				
	,JSON.Utilisationblock_SPAG38				
	,JSON.Utilisationblock_SPAH39				
	,JSON.Utilisationblock_SPAH40				
	,JSON.Utilisationblock_SPAH41				
	,JSON.Utilisationblock_SPB111				
	,JSON.Utilisationblock_SPB112				
	,JSON.Utilisationblock_SPB113				
	,JSON.Utilisationblock_SPB114				
	,JSON.Utilisationblock_SPB115				
	,JSON.Utilisationblock_SPB116				
	,JSON.Utilisationblock_SPB117				
	,JSON.Utilisationblock_SPB218				
	,JSON.Utilisationblock_SPB219				
	,JSON.Utilisationblock_SPB220				
	,JSON.Utilisationblock_SPB221				
	,JSON.Utilisationblock_SPB322				
	,JSON.Utilisationblock_SPB323				
	,JSON.Utilisationblock_SPC24					
	,JSON.Utilisationblock_SPCIICHECKDIGIT		
	,JSON.Utilisationblock_SPD25					
	,JSON.Utilisationblock_SPE126				
	,JSON.Utilisationblock_SPE127				
	,JSON.Utilisationblock_SPE128				
	,JSON.Utilisationblock_SPF129				
	,JSON.Utilisationblock_SPF130				
	,JSON.Utilisationblock_SPF131				
	,JSON.Utilisationblock_SPF232				
	,JSON.Utilisationblock_SPF233				
	,JSON.Utilisationblock_SPF334				
	,JSON.Utilisationblock_SPF335				
	,JSON.Utilisationblock_SPF336				
	,JSON.Utilisationblock_SPG37					
	,JSON.Utilisationblock_SPG38					
	,JSON.Utilisationblock_SPH39					
	,JSON.Utilisationblock_SPH40					
	,JSON.Utilisationblock_SPH41					
	,JSON.AddrLink_NDLNK01						
	,JSON.AgeDoB_EA4S01							
	,JSON.AgeDoB_EA4S02							
	,JSON.AgeDoB_EA4S02_DD						
	,JSON.AgeDoB_EA4S02_MM						
	,JSON.AgeDoB_EA4S02_YY						
	,JSON.AgeDoB_EA4S03							
	,JSON.AgeDoB_EA4S04							
	,JSON.AgeDoB_EA4S04_DD						
	,JSON.AgeDoB_EA4S04_MM						
	,JSON.AgeDoB_EA4S04_YY						
	,JSON.AgeDoB_EA4S05							
	,JSON.AgeDoB_EA4S06							
	,JSON.AgeDoB_EA4S06_DD						
	,JSON.AgeDoB_EA4S06_MM						
	,JSON.AgeDoB_EA4S06_YY						
	,JSON.AgeDoB_EA4S07							
	,JSON.AgeDoB_EA4S08							
	,JSON.AgeDoB_EA4S08_DD						
	,JSON.AgeDoB_EA4S08_MM						
	,JSON.AgeDoB_EA4S08_YY						
	,JSON.AgeDoB_EA5S01							
	,JSON.AgeDoB_NDDOB							
	,JSON.CII_NDSPACII							
	,JSON.CII_NDSPCII							
	,JSON.Director_NDDIRSP						
	,JSON.Director_NDDIRSPA						
	,JSON.ImpairedCH_NDBANKRUPT					
	,JSON.ImpairedCH_NDCCJ						
	,JSON.ImpairedCH_NDICH						
	,JSON.ImpairedCH_NDIVA						
	,JSON.ImpairedCH_NDJABANKRUPT				
	,JSON.ImpairedCH_NDJACCJ						
	,JSON.ImpairedCH_NDJAICH						
	,JSON.ImpairedCH_NDJAIVA						
	,JSON.ImpairedCH_NDJASECARR					
	,JSON.ImpairedCH_NDJAUNSECARR				
	,JSON.ImpairedCH_NDMABANKRUPT				
	,JSON.ImpairedCH_NDMACCJ						
	,JSON.ImpairedCH_NDMAICH						
	,JSON.ImpairedCH_NDMAIVA						
	,JSON.ImpairedCH_NDMASECARR					
	,JSON.ImpairedCH_NDMAUNSECARR				
	,JSON.ImpairedCH_NDSECARR					
	,JSON.ImpairedCH_NDUNSECARR					
	,JSON.Mosaic_EA4M01							
	,JSON.Mosaic_EA4M02							
	,JSON.Mosaic_EA4M03							
	,JSON.Mosaic_EA4M04							
	,JSON.Mosaic_EA4M05							
	,JSON.Mosaic_EA4M06							
	,JSON.Mosaic_EA4M07							
	,JSON.Mosaic_EA4M08							
	,JSON.Mosaic_EA4M09							
	,JSON.Mosaic_EA4M10							
	,JSON.Mosaic_EA4M11							
	,JSON.Mosaic_EA4M12							
	,JSON.Mosaic_EA4N01							
	,JSON.Mosaic_EA4N02							
	,JSON.Mosaic_EA4N03							
	,JSON.Mosaic_EA4N04							
	,JSON.Mosaic_EA4N05							
	,JSON.Mosaic_EA4T01							
	,JSON.Mosaic_EA5T01							
	,JSON.Mosaic_EA5T02							
	,JSON.Mosaic_NDG01							
	,JSON.Mosaic_NDG02							
	,JSON.Mosaic_NDG03							
	,JSON.Mosaic_NDG04							
	,JSON.Mosaic_NDG05							
	,JSON.Mosaic_NDG06							
	,JSON.Mosaic_NDG07							
	,JSON.Mosaic_NDG08							
	,JSON.Mosaic_NDG09							
	,JSON.Mosaic_NDG10							
	,JSON.Mosaic_NDG11							
	,JSON.Mosaic_NDG12							
	,JSON.Mosaic_UKMOSAIC						
	,JSON.Scoring_E5S01							
	,JSON.Scoring_E5S02							
	,JSON.Scoring_E5S041							
	,JSON.Scoring_E5S042							
	,JSON.Scoring_E5S043							
	,JSON.Scoring_E5S051							
	,JSON.Scoring_E5S052							
	,JSON.Scoring_E5S053							
	,JSON.Scoring_NDHHOSCORE						
	,JSON.Scoring_NDSI21							
	,JSON.Scoring_NDSI22							
	,JSON.Scoring_NDSI23							
	,JSON.TPD_NDHHO								
	,JSON.TPD_NDOPTOUTVALID						
	,JSON.TPD_NDPA								
	,JSON.AssetFinanceHP_SPVM101					
	,JSON.AssetFinanceHP_SPVM102					
	,JSON.AssetFinanceHP_SPVM103					
	,JSON.AssetFinanceHP_SPVM104					
	,JSON.AssetFinanceHP_SPVM105					
	,JSON.AssetFinanceHP_SPVM106					
	,JSON.AssetFinanceHP_SPVM107					
	,JSON.AssetFinanceHP_SPVM108					
	,JSON.AssetFinanceHP_SPVM109					
	,JSON.AssetFinanceHP_SPVM110					
	,JSON.AssetFinanceHP_SPVM111					
	,JSON.AssetFinanceHP_SPVM112					
	,JSON.AssetFinanceHP_SPVM113					
	,JSON.AssetFinanceHP_SPVM114					
	,JSON.AssetFinanceHP_SPVM115					
	,JSON.AssetFinanceHP_SPVM116					
	,JSON.AssetFinanceHP_SPVM117					
	,JSON.AssetFinanceHP_SPVM118					
	,JSON.AssetFinanceHP_SPVM119					
	,JSON.AssetFinanceHP_SPVM120					
	,JSON.AssetFinanceHP_SPVM121					
	,JSON.AssetFinanceHP_SPVM122					
	,JSON.AssetFinanceHP_SPVM123					
	,JSON.AssetFinanceHP_SPVM124					
	,JSON.AssetFinanceHP_SPVM125					
	,JSON.AssetFinanceHP_SPVM126					
	,JSON.AssetFinanceHP_SPVM127					
	,JSON.AssetFinanceHP_SPVM128					
	,JSON.AssetFinanceHP_SPVM129					
	,JSON.AssetFinanceHP_SPVM130					
	,JSON.AssetFinanceHP_SPVM131					
	,JSON.AssetFinanceHP_SPVM132					
	,JSON.BankCards_SPVM201						
	,JSON.BankCards_SPVM202						
	,JSON.BankCards_SPVM203						
	,JSON.BankCards_SPVM204						
	,JSON.BankCards_SPVM205						
	,JSON.BankCards_SPVM206						
	,JSON.BankCards_SPVM207						
	,JSON.BankCards_SPVM208						
	,JSON.BankCards_SPVM209						
	,JSON.BankCards_SPVM210						
	,JSON.BankCards_SPVM211						
	,JSON.BankCards_SPVM212						
	,JSON.BankCards_SPVM213						
	,JSON.BankCards_SPVM214						
	,JSON.BankCards_SPVM215						
	,JSON.BankCards_SPVM216						
	,JSON.BankCards_SPVM217						
	,JSON.BankCards_SPVM218						
	,JSON.BankCards_SPVM219						
	,JSON.BankCards_SPVM220						
	,JSON.BankCards_SPVM221						
	,JSON.BankCards_SPVM222						
	,JSON.BankCards_SPVM223						
	,JSON.BankCards_SPVM224						
	,JSON.BankCards_SPVM225						
	,JSON.BankCards_SPVM226						
	,JSON.BankCards_SPVM227						
	,JSON.BankCards_SPVM228						
	,JSON.BankCards_SPVM229						
	,JSON.BankCards_SPVM230						
	,JSON.BankCards_SPVM231						
	,JSON.BankCards_SPVM232						
	,JSON.BankCards_SPVM233						
	,JSON.BankCards_SPVM234						
	,JSON.BankCards_SPVM235						
	,JSON.BankCards_SPVM236						
	,JSON.BankCards_SPVM237						
	,JSON.BankCards_SPVM238						
	,JSON.BankCards_SPVM239						
	,JSON.BankCards_SPVM240						
	,JSON.BankCards_SPVM241						
	,JSON.CreditSales_SPVM101					
	,JSON.CreditSales_SPVM102					
	,JSON.CreditSales_SPVM103					
	,JSON.CreditSales_SPVM104					
	,JSON.CreditSales_SPVM105					
	,JSON.CreditSales_SPVM106					
	,JSON.CreditSales_SPVM107					
	,JSON.CreditSales_SPVM108					
	,JSON.CreditSales_SPVM109					
	,JSON.CreditSales_SPVM110					
	,JSON.CreditSales_SPVM111					
	,JSON.CreditSales_SPVM112					
	,JSON.CreditSales_SPVM113					
	,JSON.CreditSales_SPVM114					
	,JSON.CreditSales_SPVM115					
	,JSON.CreditSales_SPVM116					
	,JSON.CreditSales_SPVM117					
	,JSON.CreditSales_SPVM118					
	,JSON.CreditSales_SPVM119					
	,JSON.CreditSales_SPVM120					
	,JSON.CreditSales_SPVM121					
	,JSON.CreditSales_SPVM122					
	,JSON.CreditSales_SPVM123					
	,JSON.CreditSales_SPVM124					
	,JSON.CreditSales_SPVM125					
	,JSON.CreditSales_SPVM126					
	,JSON.CreditSales_SPVM127					
	,JSON.CreditSales_SPVM128					
	,JSON.CreditSales_SPVM129					
	,JSON.CreditSales_SPVM130					
	,JSON.CreditSales_SPVM131					
	,JSON.CreditSales_SPVM132					
	,JSON.CurrentAccounts_SPVM201				
	,JSON.CurrentAccounts_SPVM202				
	,JSON.CurrentAccounts_SPVM203				
	,JSON.CurrentAccounts_SPVM204				
	,JSON.CurrentAccounts_SPVM205				
	,JSON.CurrentAccounts_SPVM206				
	,JSON.CurrentAccounts_SPVM207				
	,JSON.CurrentAccounts_SPVM208				
	,JSON.CurrentAccounts_SPVM209				
	,JSON.CurrentAccounts_SPVM210				
	,JSON.CurrentAccounts_SPVM211				
	,JSON.CurrentAccounts_SPVM212				
	,JSON.CurrentAccounts_SPVM213				
	,JSON.CurrentAccounts_SPVM214				
	,JSON.CurrentAccounts_SPVM215				
	,JSON.CurrentAccounts_SPVM216				
	,JSON.CurrentAccounts_SPVM217				
	,JSON.CurrentAccounts_SPVM218				
	,JSON.CurrentAccounts_SPVM219				
	,JSON.CurrentAccounts_SPVM220				
	,JSON.CurrentAccounts_SPVM221				
	,JSON.CurrentAccounts_SPVM222				
	,JSON.CurrentAccounts_SPVM223				
	,JSON.CurrentAccounts_SPVM224				
	,JSON.CurrentAccounts_SPVM225				
	,JSON.CurrentAccounts_SPVM226				
	,JSON.CurrentAccounts_SPVM227				
	,JSON.CurrentAccounts_SPVM228				
	,JSON.CurrentAccounts_SPVM229				
	,JSON.CurrentAccounts_SPVM230				
	,JSON.CurrentAccounts_SPVM231				
	,JSON.CurrentAccounts_SPVM232				
	,JSON.CurrentAccounts_SPVM233				
	,JSON.CurrentAccounts_SPVM234				
	,JSON.CurrentAccounts_SPVM235				
	,JSON.CurrentAccounts_SPVM236				
	,JSON.CurrentAccounts_SPVM237				
	,JSON.CurrentAccounts_SPVM238				
	,JSON.CurrentAccounts_SPVM239				
	,JSON.CurrentAccounts_SPVM240				
	,JSON.CurrentAccounts_SPVM241				
	,JSON.MailOrderHomeShopping_SPVM201			
	,JSON.MailOrderHomeShopping_SPVM202			
	,JSON.MailOrderHomeShopping_SPVM203			
	,JSON.MailOrderHomeShopping_SPVM204			
	,JSON.MailOrderHomeShopping_SPVM205			
	,JSON.MailOrderHomeShopping_SPVM206			
	,JSON.MailOrderHomeShopping_SPVM207			
	,JSON.MailOrderHomeShopping_SPVM208			
	,JSON.MailOrderHomeShopping_SPVM209			
	,JSON.MailOrderHomeShopping_SPVM210			
	,JSON.MailOrderHomeShopping_SPVM211			
	,JSON.MailOrderHomeShopping_SPVM212			
	,JSON.MailOrderHomeShopping_SPVM213			
	,JSON.MailOrderHomeShopping_SPVM214			
	,JSON.MailOrderHomeShopping_SPVM215			
	,JSON.MailOrderHomeShopping_SPVM216			
	,JSON.MailOrderHomeShopping_SPVM217			
	,JSON.MailOrderHomeShopping_SPVM218			
	,JSON.MailOrderHomeShopping_SPVM219			
	,JSON.MailOrderHomeShopping_SPVM220			
	,JSON.MailOrderHomeShopping_SPVM221			
	,JSON.MailOrderHomeShopping_SPVM222			
	,JSON.MailOrderHomeShopping_SPVM223			
	,JSON.MailOrderHomeShopping_SPVM224			
	,JSON.MailOrderHomeShopping_SPVM225			
	,JSON.MailOrderHomeShopping_SPVM226			
	,JSON.MailOrderHomeShopping_SPVM227			
	,JSON.MailOrderHomeShopping_SPVM228			
	,JSON.MailOrderHomeShopping_SPVM229			
	,JSON.MailOrderHomeShopping_SPVM230			
	,JSON.MailOrderHomeShopping_SPVM231			
	,JSON.MailOrderHomeShopping_SPVM232			
	,JSON.MailOrderHomeShopping_SPVM233			
	,JSON.MailOrderHomeShopping_SPVM234			
	,JSON.MailOrderHomeShopping_SPVM235			
	,JSON.MailOrderHomeShopping_SPVM236			
	,JSON.MailOrderHomeShopping_SPVM237			
	,JSON.MailOrderHomeShopping_SPVM238			
	,JSON.MailOrderHomeShopping_SPVM239			
	,JSON.MailOrderHomeShopping_SPVM240			
	,JSON.MailOrderHomeShopping_SPVM241			
	,JSON.Mortgages_SPVM101						
	,JSON.Mortgages_SPVM102						
	,JSON.Mortgages_SPVM103						
	,JSON.Mortgages_SPVM104						
	,JSON.Mortgages_SPVM105						
	,JSON.Mortgages_SPVM106						
	,JSON.Mortgages_SPVM107						
	,JSON.Mortgages_SPVM108						
	,JSON.Mortgages_SPVM109						
	,JSON.Mortgages_SPVM110						
	,JSON.Mortgages_SPVM111						
	,JSON.Mortgages_SPVM112						
	,JSON.Mortgages_SPVM113						
	,JSON.Mortgages_SPVM114						
	,JSON.Mortgages_SPVM115						
	,JSON.Mortgages_SPVM116						
	,JSON.Mortgages_SPVM117						
	,JSON.Mortgages_SPVM118						
	,JSON.Mortgages_SPVM119						
	,JSON.Mortgages_SPVM120						
	,JSON.Mortgages_SPVM121						
	,JSON.Mortgages_SPVM122						
	,JSON.Mortgages_SPVM123						
	,JSON.Mortgages_SPVM124						
	,JSON.Mortgages_SPVM125						
	,JSON.Mortgages_SPVM126						
	,JSON.Mortgages_SPVM127						
	,JSON.Mortgages_SPVM128						
	,JSON.Mortgages_SPVM129						
	,JSON.Mortgages_SPVM130						
	,JSON.Mortgages_SPVM131						
	,JSON.Mortgages_SPVM132						
	,JSON.RetailStoreCards_SPVM201				
	,JSON.RetailStoreCards_SPVM202				
	,JSON.RetailStoreCards_SPVM203				
	,JSON.RetailStoreCards_SPVM204				
	,JSON.RetailStoreCards_SPVM205				
	,JSON.RetailStoreCards_SPVM206				
	,JSON.RetailStoreCards_SPVM207				
	,JSON.RetailStoreCards_SPVM208				
	,JSON.RetailStoreCards_SPVM209				
	,JSON.RetailStoreCards_SPVM210				
	,JSON.RetailStoreCards_SPVM211				
	,JSON.RetailStoreCards_SPVM212				
	,JSON.RetailStoreCards_SPVM213				
	,JSON.RetailStoreCards_SPVM214				
	,JSON.RetailStoreCards_SPVM215				
	,JSON.RetailStoreCards_SPVM216				
	,JSON.RetailStoreCards_SPVM217				
	,JSON.RetailStoreCards_SPVM218				
	,JSON.RetailStoreCards_SPVM219				
	,JSON.RetailStoreCards_SPVM220				
	,JSON.RetailStoreCards_SPVM221				
	,JSON.RetailStoreCards_SPVM222				
	,JSON.RetailStoreCards_SPVM223				
	,JSON.RetailStoreCards_SPVM224				
	,JSON.RetailStoreCards_SPVM225				
	,JSON.RetailStoreCards_SPVM226				
	,JSON.RetailStoreCards_SPVM227				
	,JSON.RetailStoreCards_SPVM228				
	,JSON.RetailStoreCards_SPVM229				
	,JSON.RetailStoreCards_SPVM230				
	,JSON.RetailStoreCards_SPVM231				
	,JSON.RetailStoreCards_SPVM232				
	,JSON.RetailStoreCards_SPVM233				
	,JSON.RetailStoreCards_SPVM234				
	,JSON.RetailStoreCards_SPVM235				
	,JSON.RetailStoreCards_SPVM236				
	,JSON.RetailStoreCards_SPVM237				
	,JSON.RetailStoreCards_SPVM238				
	,JSON.RetailStoreCards_SPVM239				
	,JSON.RetailStoreCards_SPVM240				
	,JSON.RetailStoreCards_SPVM241				
	,JSON.SecuredLoans_SPVM101					
	,JSON.SecuredLoans_SPVM102					
	,JSON.SecuredLoans_SPVM103					
	,JSON.SecuredLoans_SPVM104					
	,JSON.SecuredLoans_SPVM105					
	,JSON.SecuredLoans_SPVM106					
	,JSON.SecuredLoans_SPVM107					
	,JSON.SecuredLoans_SPVM108					
	,JSON.SecuredLoans_SPVM109					
	,JSON.SecuredLoans_SPVM110					
	,JSON.SecuredLoans_SPVM111					
	,JSON.SecuredLoans_SPVM112					
	,JSON.SecuredLoans_SPVM113					
	,JSON.SecuredLoans_SPVM114					
	,JSON.SecuredLoans_SPVM115					
	,JSON.SecuredLoans_SPVM116					
	,JSON.SecuredLoans_SPVM117					
	,JSON.SecuredLoans_SPVM118					
	,JSON.SecuredLoans_SPVM119					
	,JSON.SecuredLoans_SPVM120					
	,JSON.SecuredLoans_SPVM121					
	,JSON.SecuredLoans_SPVM122					
	,JSON.SecuredLoans_SPVM123					
	,JSON.SecuredLoans_SPVM124					
	,JSON.SecuredLoans_SPVM125					
	,JSON.SecuredLoans_SPVM126					
	,JSON.SecuredLoans_SPVM127					
	,JSON.SecuredLoans_SPVM128					
	,JSON.SecuredLoans_SPVM129					
	,JSON.SecuredLoans_SPVM130					
	,JSON.SecuredLoans_SPVM131					
	,JSON.SecuredLoans_SPVM132					
	,JSON.UnsecuredLoans_SPVM101					
	,JSON.UnsecuredLoans_SPVM102					
	,JSON.UnsecuredLoans_SPVM103					
	,JSON.UnsecuredLoans_SPVM104					
	,JSON.UnsecuredLoans_SPVM105					
	,JSON.UnsecuredLoans_SPVM106					
	,JSON.UnsecuredLoans_SPVM107					
	,JSON.UnsecuredLoans_SPVM108					
	,JSON.UnsecuredLoans_SPVM109					
	,JSON.UnsecuredLoans_SPVM110					
	,JSON.UnsecuredLoans_SPVM111					
	,JSON.UnsecuredLoans_SPVM112					
	,JSON.UnsecuredLoans_SPVM113					
	,JSON.UnsecuredLoans_SPVM114					
	,JSON.UnsecuredLoans_SPVM115					
	,JSON.UnsecuredLoans_SPVM116					
	,JSON.UnsecuredLoans_SPVM117					
	,JSON.UnsecuredLoans_SPVM118					
	,JSON.UnsecuredLoans_SPVM119					
	,JSON.UnsecuredLoans_SPVM120					
	,JSON.UnsecuredLoans_SPVM121					
	,JSON.UnsecuredLoans_SPVM122					
	,JSON.UnsecuredLoans_SPVM123					
	,JSON.UnsecuredLoans_SPVM124					
	,JSON.UnsecuredLoans_SPVM125					
	,JSON.UnsecuredLoans_SPVM126					
	,JSON.UnsecuredLoans_SPVM127					
	,JSON.UnsecuredLoans_SPVM128					
	,JSON.UnsecuredLoans_SPVM129					
	,JSON.UnsecuredLoans_SPVM130					
	,JSON.UnsecuredLoans_SPVM131					
	,JSON.UnsecuredLoans_SPVM132					
	,JSON.Utilities_SPVM101						
	,JSON.Utilities_SPVM102						
	,JSON.Utilities_SPVM103						
	,JSON.Utilities_SPVM104						
	,JSON.Utilities_SPVM105						
	,JSON.Utilities_SPVM106						
	,JSON.Utilities_SPVM107						
	,JSON.Utilities_SPVM108						
	,JSON.Utilities_SPVM109						
	,JSON.Utilities_SPVM110						
	,JSON.Utilities_SPVM111						
	,JSON.Utilities_SPVM112						
	,JSON.Utilities_SPVM113						
	,JSON.Utilities_SPVM114						
	,JSON.Utilities_SPVM115						
	,JSON.Utilities_SPVM116						
	,JSON.Utilities_SPVM117						
	,JSON.Utilities_SPVM118						
	,JSON.Utilities_SPVM119						
	,JSON.Utilities_SPVM120						
	,JSON.Utilities_SPVM121						
	,JSON.Utilities_SPVM122						
	,JSON.Utilities_SPVM123						
	,JSON.Utilities_SPVM124						
	,JSON.Utilities_SPVM125						
	,JSON.Utilities_SPVM126						
	,JSON.Utilities_SPVM127						
	,JSON.Utilities_SPVM128						
	,JSON.Utilities_SPVM129						
	,JSON.Utilities_SPVM130						
	,JSON.Utilities_SPVM131						
	,JSON.Utilities_SPVM132						
FROM [Delphi].[ECTDB_UAT_Raw_Stg] AS sbd 
CROSS APPLY Openjson(sbd.[JSON_Response]) WITH (
	APACSCCBehavrlData_CCDATASUPPLIED									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.APACSCCBehavrlData.CCDATASUPPLIED'
	,APACSCCBehavrlData_CLUCLIL6M									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.APACSCCBehavrlData.CLUCLIL6M'
	,APACSCCBehavrlData_CLUCLIL6MNPRL6M									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.APACSCCBehavrlData.CLUCLIL6MNPRL6M'
	,APACSCCBehavrlData_CLUNPRL1M									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.APACSCCBehavrlData.CLUNPRL1M'
	,APACSCCBehavrlData_NOASBNPRL1M									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.APACSCCBehavrlData.NOASBNPRL1M'
	,APACSCCBehavrlData_NOCAL1M									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.APACSCCBehavrlData.NOCAL1M'
	,APACSCCBehavrlData_NOCAL3M									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.APACSCCBehavrlData.NOCAL3M'
	,APACSCCBehavrlData_NOCLDL3M									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.APACSCCBehavrlData.NOCLDL3M'
	,APACSCCBehavrlData_NOMLVCAL1M									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.APACSCCBehavrlData.NOMLVCAL1M'
	,APACSCCBehavrlData_NOMLVCAL3M									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.APACSCCBehavrlData.NOMLVCAL3M'
	,APACSCCBehavrlData_NOMPMNPRL3M									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.APACSCCBehavrlData.NOMPMNPRL3M'
	,APACSCCBehavrlData_PTBRL3MNPRL3M									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.APACSCCBehavrlData.PTBRL3MNPRL3M'
	,APACSCCBehavrlData_PTBRL6MNPRL6M									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.APACSCCBehavrlData.PTBRL6MNPRL6M'
	,APACSCCBehavrlData_PTSBRL3MNPRL3M									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.APACSCCBehavrlData.PTSBRL3MNPRL3M'
	,APACSCCBehavrlData_PTSBRL6MNPRL6M									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.APACSCCBehavrlData.PTSBRL6MNPRL6M'
	,EstimatedDisposableIncomeRAG_TRD_RAG_01									NVARCHAR(2)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-01"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_02									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-02"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_03									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-03"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_04									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-04"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_05									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-05"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_06									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-06"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_07									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-07"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_08									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-08"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_09									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-09"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_10									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-10"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_11									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-11"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_12									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-12"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_13									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-13"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_14									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-14"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_15									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-15"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_16									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-16"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_17									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-17"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_18									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-18"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_19									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-19"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_20									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-20"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_21									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-21"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_22									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-22"'
	,EstimatedDisposableIncomeRAG_TRD_RAG_23									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.EstimatedDisposableIncomeRAG."TRD-RAG-23"'
	,HighCostCredit_HCA01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCA01'
	,HighCostCredit_HCA02									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCA02'
	,HighCostCredit_HCA03									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCA03'
	,HighCostCredit_HCA04									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCA04'
	,HighCostCredit_HCA05									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCA05'
	,HighCostCredit_HCA06									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCA06'
	,HighCostCredit_HCA07									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCA07'
	,HighCostCredit_HCA08									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCA08'
	,HighCostCredit_HCA09									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCA09'
	,HighCostCredit_HCA10									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCA10'
	,HighCostCredit_HCA11									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCA11'
	,HighCostCredit_HCA12									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCA12'
	,HighCostCredit_HCA13									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCA13'
	,HighCostCredit_HCA14									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCA14'
	,HighCostCredit_HCB01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCB01'
	,HighCostCredit_HCB02									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCB02'
	,HighCostCredit_HCB03									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCB03'
	,HighCostCredit_HCB04									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCB04'
	,HighCostCredit_HCC01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCC01'
	,HighCostCredit_HCC02									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCC02'
	,HighCostCredit_HCC03									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCC03'
	,HighCostCredit_HCC04									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCC04'
	,HighCostCredit_HCC05									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCC05'
	,HighCostCredit_HCD01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCD01'
	,HighCostCredit_HCD02									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCD02'
	,HighCostCredit_HCE01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCE01'
	,HighCostCredit_HCE02									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCE02'
	,HighCostCredit_HCE03									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCE03'
	,HighCostCredit_HCF01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCF01'
	,HighCostCredit_HCF02									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCF02'
	,HighCostCredit_HCF03									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCF03'
	,HighCostCredit_HCF04									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCF04'
	,HighCostCredit_HCF05									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCF05'
	,HighCostCredit_HCF06									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCF06'
	,HighCostCredit_HCP01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCP01'
	,HighCostCredit_HCP02									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCP02'
	,HighCostCredit_HCP03									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCP03'
	,HighCostCredit_HCP04									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCP04'
	,HighCostCredit_HCP05									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCP05'
	,HighCostCredit_HCP06									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCP06'
	,HighCostCredit_HCP07									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCP07'
	,HighCostCredit_HCP08									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.HCP08'
	,HighCostCredit_PDA01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDA01'
	,HighCostCredit_PDA02									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDA02'
	,HighCostCredit_PDA03									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDA03'
	,HighCostCredit_PDA04									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDA04'
	,HighCostCredit_PDB05									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDB05'
	,HighCostCredit_PDB06									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDB06'
	,HighCostCredit_PDB07									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDB07'
	,HighCostCredit_PDB08									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDB08'
	,HighCostCredit_PDB09									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDB09'
	,HighCostCredit_PDB10									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDB10'
	,HighCostCredit_PDC11									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDC11'
	,HighCostCredit_PDC12									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDC12'
	,HighCostCredit_PDC13									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDC13'
	,HighCostCredit_PDD14									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDD14'
	,HighCostCredit_PDD15									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDD15'
	,HighCostCredit_PDD16									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDD16'
	,HighCostCredit_PDE17									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDE17'
	,HighCostCredit_PDE18									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDE18'
	,HighCostCredit_PDF19									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDF19'
	,HighCostCredit_PDF20									NVARCHAR(8)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDF20'
	,HighCostCredit_PDF21									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDF21'
	,HighCostCredit_PDF22									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDF22'
	,HighCostCredit_PDF23									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDF23'
	,HighCostCredit_PDF24									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDF24'
	,HighCostCredit_PDF25									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDF25'
	,HighCostCredit_PDF26									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDF26'
	,HighCostCredit_PDF27									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDF27'
	,HighCostCredit_PDF28									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit.PDF28'
	,HighCostCredit_TRD_STL_01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-01"'
	,HighCostCredit_TRD_STL_02									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-02"'
	,HighCostCredit_TRD_STL_03									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-03"'
	,HighCostCredit_TRD_STL_04									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-04"'
	,HighCostCredit_TRD_STL_05									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-05"'
	,HighCostCredit_TRD_STL_06									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-06"'
	,HighCostCredit_TRD_STL_07									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-07"'
	,HighCostCredit_TRD_STL_08									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-08"'
	,HighCostCredit_TRD_STL_09									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-09"'
	,HighCostCredit_TRD_STL_10									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-10"'
	,HighCostCredit_TRD_STL_11									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-11"'
	,HighCostCredit_TRD_STL_12									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-12"'
	,HighCostCredit_TRD_STL_13									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-13"'
	,HighCostCredit_TRD_STL_14									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-14"'
	,HighCostCredit_TRD_STL_15									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-15"'
	,HighCostCredit_TRD_STL_16									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-16"'
	,HighCostCredit_TRD_STL_17									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-17"'
	,HighCostCredit_TRD_STL_18									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-18"'
	,HighCostCredit_TRD_STL_19									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-19"'
	,HighCostCredit_TRD_STL_20									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-20"'
	,HighCostCredit_TRD_STL_21									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-21"'
	,HighCostCredit_TRD_STL_22									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-22"'
	,HighCostCredit_TRD_STL_23									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.HighCostCredit."TRD-STL-23"'

	,NeverPaidDefsBlock_SPABALEBADS									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPABALEBADS'
	,NeverPaidDefsBlock_SPABALEBADSL12									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPABALEBADSL12'
	,NeverPaidDefsBlock_SPABALNPD									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPABALNPD'
	,NeverPaidDefsBlock_SPABALNPDL12									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPABALNPDL12'
	,NeverPaidDefsBlock_SPAMTHFSTEBAD									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPAMTHFSTEBAD'
	,NeverPaidDefsBlock_SPANOEBADS									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPANOEBADS'
	,NeverPaidDefsBlock_SPANOEBADSL12									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPANOEBADSL12'
	,NeverPaidDefsBlock_SPANONPD									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPANONPD'
	,NeverPaidDefsBlock_SPANONPDL12									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPANONPDL12'
	,NeverPaidDefsBlock_SPATSMREBAD									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPATSMREBAD'
	,NeverPaidDefsBlock_SPATSMRNPD									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPATSMRNPD'
	,NeverPaidDefsBlock_SPBALEBADS									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPBALEBADS'
	,NeverPaidDefsBlock_SPBALEBADSL12									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPBALEBADSL12'
	,NeverPaidDefsBlock_SPBALNPD									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPBALNPD'
	,NeverPaidDefsBlock_SPBALNPDL12									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPBALNPDL12'
	,NeverPaidDefsBlock_SPMTHFSTEBAD									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPMTHFSTEBAD'
	,NeverPaidDefsBlock_SPNOEBADS									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPNOEBADS'
	,NeverPaidDefsBlock_SPNOEBADSL12									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPNOEBADSL12'
	,NeverPaidDefsBlock_SPNONPD									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPNONPD'
	,NeverPaidDefsBlock_SPNONPDL12									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPNONPDL12'
	,NeverPaidDefsBlock_SPTSMREBAD									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPTSMREBAD'
	,NeverPaidDefsBlock_SPTSMRNPD									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.NeverPaidDefsBlock.SPTSMRNPD'
	,TelecommsBlock_SPBALACTTEL									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TelecommsBlock.SPBALACTTEL'
	,TelecommsBlock_SPNOACTTEL									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TelecommsBlock.SPNOACTTEL'
	,TelecommsBlock_SPNODEL									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TelecommsBlock.SPNODEL'
	,TelecommsBlock_SPNOINACTTEL36									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TelecommsBlock.SPNOINACTTEL36'
	,TelecommsBlock_SPNOINACTTELL12									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TelecommsBlock.SPNOINACTTELL12'
	,TelecommsBlock_SPNOINACTTELL24									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TelecommsBlock.SPNOINACTTELL24'
	,TelecommsBlock_SPTOTNOACTTEL									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TelecommsBlock.SPTOTNOACTTEL'
	,TelecommsBlock_SPTOTNOSET									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TelecommsBlock.SPTOTNOSET'
	,TelecommsBlock_SPTOTNOSETL12									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TelecommsBlock.SPTOTNOSETL12'
	,TelecommsBlock_SPTOTNOSETL24									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TelecommsBlock.SPTOTNOSETL24'
	,TelecommsBlock_SPTOTNOSETL36									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TelecommsBlock.SPTOTNOSETL36'
	,TelecommsBlock_SPTSMRSETTEL									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TelecommsBlock.SPTSMRSETTEL'
	,TelecommsBlock_SPTSMRTEL									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TelecommsBlock.SPTSMRTEL'
	,TelecommsBlock_SPTSMRTELDEL									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TelecommsBlock.SPTSMRTELDEL'
	,TelecommsBlock_SPVALDEL									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TelecommsBlock.SPVALDEL'
	,TrendedData_TRD_A_01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-01"'
	,TrendedData_TRD_A_02									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-02"'
	,TrendedData_TRD_A_03									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-03"'
	,TrendedData_TRD_A_04									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-04"'
	,TrendedData_TRD_A_05									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-05"'
	,TrendedData_TRD_A_06									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-06"'
	,TrendedData_TRD_A_07									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-07"'
	,TrendedData_TRD_A_08									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-08"'
	,TrendedData_TRD_A_09									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-09"'
	,TrendedData_TRD_A_10									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-10"'
	,TrendedData_TRD_A_11									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-11"'
	,TrendedData_TRD_A_12									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-12"'
	,TrendedData_TRD_A_13									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-13"'
	,TrendedData_TRD_A_14									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-14"'
	,TrendedData_TRD_A_15									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-15"'
	,TrendedData_TRD_A_16									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-16"'
	,TrendedData_TRD_A_17									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-17"'
	,TrendedData_TRD_A_18									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-18"'
	,TrendedData_TRD_A_19									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-19"'
	,TrendedData_TRD_A_20									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-20"'
	,TrendedData_TRD_A_21									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-21"'
	,TrendedData_TRD_A_22									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-22"'
	,TrendedData_TRD_A_23									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-A-23"'
	,TrendedData_TRD_B_01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-01"'
	,TrendedData_TRD_B_02									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-02"'
	,TrendedData_TRD_B_03									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-03"'
	,TrendedData_TRD_B_04									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-04"'
	,TrendedData_TRD_B_05									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-05"'
	,TrendedData_TRD_B_06									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-06"'
	,TrendedData_TRD_B_07									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-07"'
	,TrendedData_TRD_B_08									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-08"'
	,TrendedData_TRD_B_09									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-09"'
	,TrendedData_TRD_B_10									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-10"'
	,TrendedData_TRD_B_11									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-11"'
	,TrendedData_TRD_B_12									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-12"'
	,TrendedData_TRD_B_13									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-13"'
	,TrendedData_TRD_B_14									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-14"'
	,TrendedData_TRD_B_15									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-15"'
	,TrendedData_TRD_B_16									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-16"'
	,TrendedData_TRD_B_17									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-17"'
	,TrendedData_TRD_B_18									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-18"'
	,TrendedData_TRD_B_19									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-19"'
	,TrendedData_TRD_B_20									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-20"'
	,TrendedData_TRD_B_21									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-21"'
	,TrendedData_TRD_B_22									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-22"'
	,TrendedData_TRD_B_23									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-23"'
	,TrendedData_TRD_B_24									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-24"'
	,TrendedData_TRD_B_25									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-25"'
	,TrendedData_TRD_B_26									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-26"'
	,TrendedData_TRD_B_27									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-27"'
	,TrendedData_TRD_B_28									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-28"'
	,TrendedData_TRD_B_29									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-29"'
	,TrendedData_TRD_B_30									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-30"'
	,TrendedData_TRD_B_31									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-31"'
	,TrendedData_TRD_B_32									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-32"'
	,TrendedData_TRD_B_33									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-33"'
	,TrendedData_TRD_B_34									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-34"'
	,TrendedData_TRD_B_35									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-35"'
	,TrendedData_TRD_B_36									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-36"'
	,TrendedData_TRD_B_37									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-37"'
	,TrendedData_TRD_B_38									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-38"'
	,TrendedData_TRD_B_39									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-39"'
	,TrendedData_TRD_B_40									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-40"'
	,TrendedData_TRD_B_41									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-41"'
	,TrendedData_TRD_B_42									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-42"'
	,TrendedData_TRD_B_43									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-43"'
	,TrendedData_TRD_B_44									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-44"'
	,TrendedData_TRD_B_45									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-45"'
	,TrendedData_TRD_B_46									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-46"'
	,TrendedData_TRD_B_47									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-47"'
	,TrendedData_TRD_B_48									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-48"'
	,TrendedData_TRD_B_49									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-49"'
	,TrendedData_TRD_B_50									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-50"'
	,TrendedData_TRD_B_51									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-51"'
	,TrendedData_TRD_B_52									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-52"'
	,TrendedData_TRD_B_53									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-B-53"'
	,TrendedData_TRD_C_01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-01"'
	,TrendedData_TRD_C_02									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-02"'
	,TrendedData_TRD_C_03									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-03"'
	,TrendedData_TRD_C_04									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-04"'
	,TrendedData_TRD_C_05									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-05"'
	,TrendedData_TRD_C_06									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-06"'
	,TrendedData_TRD_C_07									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-07"'
	,TrendedData_TRD_C_08									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-08"'
	,TrendedData_TRD_C_09									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-09"'
	,TrendedData_TRD_C_10									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-10"'
	,TrendedData_TRD_C_11									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-11"'
	,TrendedData_TRD_C_12									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-12"'
	,TrendedData_TRD_C_13									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-13"'
	,TrendedData_TRD_C_14									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-14"'
	,TrendedData_TRD_C_15									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-15"'
	,TrendedData_TRD_C_16									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-16"'
	,TrendedData_TRD_C_17									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-17"'
	,TrendedData_TRD_C_18									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-C-18"'
	,TrendedData_TRD_O_01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-O-01"'
	,TrendedData_TRD_O_02									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-O-02"'
	,TrendedData_TRD_O_03									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-O-03"'
	,TrendedData_TRD_O_04									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-O-04"'
	,TrendedData_TRD_O_05									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-O-05"'
	,TrendedData_TRD_O_06									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-O-06"'
	,TrendedData_TRD_O_07									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-O-07"'
	,TrendedData_TRD_O_08									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-O-08"'
	,TrendedData_TRD_O_09									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-O-09"'
	,TrendedData_TRD_O_10									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-O-10"'
	,TrendedData_TRD_O_11									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-O-11"'
	,TrendedData_TRD_O_12									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-O-12"'
	,TrendedData_TRD_O_13									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-O-13"'
	,TrendedData_TRD_O_14									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-O-14"'
	,TrendedData_TRD_O_15									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-O-15"'
	,TrendedData_TRD_O_16									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-O-16"'
	,TrendedData_TRD_P_01									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-01"'
	,TrendedData_TRD_P_02									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-02"'
	,TrendedData_TRD_P_03									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-03"'
	,TrendedData_TRD_P_04									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-04"'
	,TrendedData_TRD_P_05									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-05"'
	,TrendedData_TRD_P_06									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-06"'
	,TrendedData_TRD_P_07									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-07"'
	,TrendedData_TRD_P_08									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-08"'
	,TrendedData_TRD_P_09									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-09"'
	,TrendedData_TRD_P_10									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-10"'
	,TrendedData_TRD_P_11									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-11"'
	,TrendedData_TRD_P_12									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-12"'
	,TrendedData_TRD_P_13									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-13"'
	,TrendedData_TRD_P_14									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-14"'
	,TrendedData_TRD_P_15									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-15"'
	,TrendedData_TRD_P_16									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-16"'
	,TrendedData_TRD_P_17									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-17"'
	,TrendedData_TRD_P_18									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-18"'
	,TrendedData_TRD_P_19									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-19"'
	,TrendedData_TRD_P_20									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-20"'
	,TrendedData_TRD_P_21									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-21"'
	,TrendedData_TRD_P_22									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-22"'
	,TrendedData_TRD_P_23									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-23"'
	,TrendedData_TRD_P_24									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-24"'
	,TrendedData_TRD_P_25									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-25"'
	,TrendedData_TRD_P_26									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-26"'
	,TrendedData_TRD_P_27									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-27"'
	,TrendedData_TRD_P_28									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-28"'
	,TrendedData_TRD_P_29									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-29"'
	,TrendedData_TRD_P_30									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-30"'
	,TrendedData_TRD_P_31									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-31"'
	,TrendedData_TRD_P_32									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-32"'
	,TrendedData_TRD_P_33									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-33"'
	,TrendedData_TRD_P_34									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-34"'
	,TrendedData_TRD_P_35									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-35"'
	,TrendedData_TRD_P_36									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-36"'
	,TrendedData_TRD_P_37									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-37"'
	,TrendedData_TRD_P_38									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-38"'
	,TrendedData_TRD_P_39									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-39"'
	,TrendedData_TRD_P_40									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-P-40"'
	,TrendedData_TRD_S_01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-S-01"'
	,TrendedData_TRD_S_02									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.TrendedData."TRD-S-02"'
	,Utilisationblock_SPA01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPA01'
	,Utilisationblock_SPA02									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPA02'
	,Utilisationblock_SPA03									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPA03'
	,Utilisationblock_SPA04									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPA04'
	,Utilisationblock_SPA05									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPA05'
	,Utilisationblock_SPA06									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPA06'
	,Utilisationblock_SPA07									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPA07'
	,Utilisationblock_SPA08									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPA08'
	,Utilisationblock_SPA09									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPA09'
	,Utilisationblock_SPA10									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPA10'
	,Utilisationblock_SPAA01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAA01'
	,Utilisationblock_SPAA02									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAA02'
	,Utilisationblock_SPAA03									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAA03'
	,Utilisationblock_SPAA04									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAA04'
	,Utilisationblock_SPAA05									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAA05'
	,Utilisationblock_SPAA06									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAA06'
	,Utilisationblock_SPAA07									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAA07'
	,Utilisationblock_SPAA08									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAA08'
	,Utilisationblock_SPAA09									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAA09'
	,Utilisationblock_SPAA10									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAA10'
	,Utilisationblock_SPAB111									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAB111'
	,Utilisationblock_SPAB112									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAB112'
	,Utilisationblock_SPAB113									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAB113'
	,Utilisationblock_SPAB114									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAB114'
	,Utilisationblock_SPAB115									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAB115'
	,Utilisationblock_SPAB116									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAB116'
	,Utilisationblock_SPAB117									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAB117'
	,Utilisationblock_SPAB218									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAB218'
	,Utilisationblock_SPAB219									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAB219'
	,Utilisationblock_SPAB220									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAB220'
	,Utilisationblock_SPAB221									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAB221'
	,Utilisationblock_SPAB322									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAB322'
	,Utilisationblock_SPAB323									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAB323'
	,Utilisationblock_SPAC24									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAC24'
	,Utilisationblock_SPACIICHECKDIGIT									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPACIICHECKDIGIT'
	,Utilisationblock_SPAD25									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAD25'
	,Utilisationblock_SPAE126									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAE126'
	,Utilisationblock_SPAE127									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAE127'
	,Utilisationblock_SPAE128									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAE128'
	,Utilisationblock_SPAF129									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAF129'
	,Utilisationblock_SPAF130									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAF130'
	,Utilisationblock_SPAF131									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAF131'
	,Utilisationblock_SPAF232									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAF232'
	,Utilisationblock_SPAF233									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAF233'
	,Utilisationblock_SPAF334									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAF334'
	,Utilisationblock_SPAF335									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAF335'
	,Utilisationblock_SPAF336									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAF336'
	,Utilisationblock_SPAG37									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAG37'
	,Utilisationblock_SPAG38									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAG38'
	,Utilisationblock_SPAH39									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAH39'
	,Utilisationblock_SPAH40									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAH40'
	,Utilisationblock_SPAH41									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPAH41'
	,Utilisationblock_SPB111									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPB111'
	,Utilisationblock_SPB112									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPB112'
	,Utilisationblock_SPB113									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPB113'
	,Utilisationblock_SPB114									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPB114'
	,Utilisationblock_SPB115									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPB115'
	,Utilisationblock_SPB116									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPB116'
	,Utilisationblock_SPB117									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPB117'
	,Utilisationblock_SPB218									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPB218'
	,Utilisationblock_SPB219									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPB219'
	,Utilisationblock_SPB220									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPB220'
	,Utilisationblock_SPB221									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPB221'
	,Utilisationblock_SPB322									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPB322'
	,Utilisationblock_SPB323									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPB323'
	,Utilisationblock_SPC24									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPC24'
	,Utilisationblock_SPCIICHECKDIGIT									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPCIICHECKDIGIT'
	,Utilisationblock_SPD25									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPD25'
	,Utilisationblock_SPE126									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPE126'
	,Utilisationblock_SPE127									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPE127'
	,Utilisationblock_SPE128									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPE128'
	,Utilisationblock_SPF129									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPF129'
	,Utilisationblock_SPF130									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPF130'
	,Utilisationblock_SPF131									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPF131'
	,Utilisationblock_SPF232									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPF232'
	,Utilisationblock_SPF233									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPF233'
	,Utilisationblock_SPF334									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPF334'
	,Utilisationblock_SPF335									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPF335'
	,Utilisationblock_SPF336									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPF336'
	,Utilisationblock_SPG37									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPG37'
	,Utilisationblock_SPG38									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPG38'
	,Utilisationblock_SPH39									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPH39'
	,Utilisationblock_SPH40									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPH40'
	,Utilisationblock_SPH41									INT									N'$.Response.ConsumerSummary.PremiumValueData.AdditDelphiBlocks.Utilisationblock.SPH41'
	,AddrLink_NDLNK01									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.AddrLink.NDLNK01'


	/*
		- EA4S02, EA4S04, EA4S06 & EA4S08 look like dates. Other dates dont get this breakdown in the actual response
		- The names (i.e. EA4S02_EA4S02_YY) are a logic fault in the SAS code that wrote this (only these variables are affected)
		- Manually patched them
		- Also added a new row for each as a DATE type, in case comes in in future
	*/
	,AgeDoB_EA4S01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S01'
	,AgeDoB_EA4S02									NVARCHAR(100)								N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S02'
	,AgeDoB_EA4S02_DD								INT									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S02.DD'
	,AgeDoB_EA4S02_MM								INT									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S02.MM'
	,AgeDoB_EA4S02_YY								INT									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S02.YY'
	,AgeDoB_EA4S03									INT									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S03'
	,AgeDoB_EA4S04									NVARCHAR(100)								N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S04'
	,AgeDoB_EA4S04_DD								INT									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S04.DD'
	,AgeDoB_EA4S04_MM								INT									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S04.MM'
	,AgeDoB_EA4S04_YY								INT									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S04.YY'
	,AgeDoB_EA4S05									INT									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S05'
	,AgeDoB_EA4S06									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S06'
	,AgeDoB_EA4S06_DD								INT									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S06.DD'
	,AgeDoB_EA4S06_MM								INT									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S06.MM'
	,AgeDoB_EA4S06_YY								INT									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S06.YY'
	,AgeDoB_EA4S07									INT									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S07'
	,AgeDoB_EA4S08									NVARCHAR(100)									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S08'
	,AgeDoB_EA4S08_DD								INT									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S08.DD'
	,AgeDoB_EA4S08_MM								INT									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S08.MM'
	,AgeDoB_EA4S08_YY								INT									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA4S08.YY'
	,AgeDoB_EA5S01									INT									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.EA5S01'
	,AgeDoB_NDDOB									NVARCHAR(10)									N'$.Response.ConsumerSummary.PremiumValueData.AgeDoB.NDDOB'


	,CII_NDSPACII									INT									N'$.Response.ConsumerSummary.PremiumValueData.CII.NDSPACII'
	,CII_NDSPCII									INT									N'$.Response.ConsumerSummary.PremiumValueData.CII.NDSPCII'
	,Director_NDDIRSP									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.Director.NDDIRSP'
	,Director_NDDIRSPA									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.Director.NDDIRSPA'
	,ImpairedCH_NDBANKRUPT									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDBANKRUPT'
	,ImpairedCH_NDCCJ									INT									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDCCJ'
	,ImpairedCH_NDICH									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDICH'
	,ImpairedCH_NDIVA									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDIVA'
	,ImpairedCH_NDJABANKRUPT									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDJABANKRUPT'
	,ImpairedCH_NDJACCJ									INT									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDJACCJ'
	,ImpairedCH_NDJAICH									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDJAICH'
	,ImpairedCH_NDJAIVA									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDJAIVA'
	,ImpairedCH_NDJASECARR									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDJASECARR'
	,ImpairedCH_NDJAUNSECARR									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDJAUNSECARR'
	,ImpairedCH_NDMABANKRUPT									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDMABANKRUPT'
	,ImpairedCH_NDMACCJ									INT									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDMACCJ'
	,ImpairedCH_NDMAICH									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDMAICH'
	,ImpairedCH_NDMAIVA									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDMAIVA'
	,ImpairedCH_NDMASECARR									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDMASECARR'
	,ImpairedCH_NDMAUNSECARR									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDMAUNSECARR'
	,ImpairedCH_NDSECARR									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDSECARR'
	,ImpairedCH_NDUNSECARR									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.ImpairedCH.NDUNSECARR'
	,Mosaic_EA4M01									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4M01'
	,Mosaic_EA4M02									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4M02'
	,Mosaic_EA4M03									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4M03'
	,Mosaic_EA4M04									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4M04'
	,Mosaic_EA4M05									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4M05'
	,Mosaic_EA4M06									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4M06'
	,Mosaic_EA4M07									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4M07'
	,Mosaic_EA4M08									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4M08'
	,Mosaic_EA4M09									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4M09'
	,Mosaic_EA4M10									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4M10'
	,Mosaic_EA4M11									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4M11'
	,Mosaic_EA4M12									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4M12'
	,Mosaic_EA4N01									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4N01'
	,Mosaic_EA4N02									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4N02'
	,Mosaic_EA4N03									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4N03'
	,Mosaic_EA4N04									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4N04'
	,Mosaic_EA4N05									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4N05'
	,Mosaic_EA4T01									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA4T01'
	,Mosaic_EA5T01									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA5T01'
	,Mosaic_EA5T02									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.EA5T02'
	,Mosaic_NDG01									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.NDG01'
	,Mosaic_NDG02									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.NDG02'
	,Mosaic_NDG03									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.NDG03'
	,Mosaic_NDG04									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.NDG04'
	,Mosaic_NDG05									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.NDG05'
	,Mosaic_NDG06									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.NDG06'
	,Mosaic_NDG07									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.NDG07'
	,Mosaic_NDG08									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.NDG08'
	,Mosaic_NDG09									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.NDG09'
	,Mosaic_NDG10									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.NDG10'
	,Mosaic_NDG11									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.NDG11'
	,Mosaic_NDG12									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.NDG12'
	,Mosaic_UKMOSAIC									INT									N'$.Response.ConsumerSummary.PremiumValueData.Mosaic.UKMOSAIC'
	,Scoring_E5S01									INT									N'$.Response.ConsumerSummary.PremiumValueData.Scoring.E5S01'
	,Scoring_E5S02									INT									N'$.Response.ConsumerSummary.PremiumValueData.Scoring.E5S02'
	,Scoring_E5S041									NVARCHAR(2)									N'$.Response.ConsumerSummary.PremiumValueData.Scoring.E5S041'
	,Scoring_E5S042									NVARCHAR(2)									N'$.Response.ConsumerSummary.PremiumValueData.Scoring.E5S042'
	,Scoring_E5S043									NVARCHAR(2)									N'$.Response.ConsumerSummary.PremiumValueData.Scoring.E5S043'
	,Scoring_E5S051									INT									N'$.Response.ConsumerSummary.PremiumValueData.Scoring.E5S051'
	,Scoring_E5S052									INT									N'$.Response.ConsumerSummary.PremiumValueData.Scoring.E5S052'
	,Scoring_E5S053									INT									N'$.Response.ConsumerSummary.PremiumValueData.Scoring.E5S053'
	,Scoring_NDHHOSCORE									INT									N'$.Response.ConsumerSummary.PremiumValueData.Scoring.NDHHOSCORE'
	,Scoring_NDSI21									NVARCHAR(5)									N'$.Response.ConsumerSummary.PremiumValueData.Scoring.NDSI21'
	,Scoring_NDSI22									NVARCHAR(5)									N'$.Response.ConsumerSummary.PremiumValueData.Scoring.NDSI22'
	,Scoring_NDSI23									NVARCHAR(5)									N'$.Response.ConsumerSummary.PremiumValueData.Scoring.NDSI23'
	,TPD_NDHHO									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.TPD.NDHHO'
	,TPD_NDOPTOUTVALID									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.TPD.NDOPTOUTVALID'
	,TPD_NDPA									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.TPD.NDPA'
	,AssetFinanceHP_SPVM101									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM101'
	,AssetFinanceHP_SPVM102									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM102'
	,AssetFinanceHP_SPVM103									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM103'
	,AssetFinanceHP_SPVM104									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM104'
	,AssetFinanceHP_SPVM105									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM105'
	,AssetFinanceHP_SPVM106									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM106'
	,AssetFinanceHP_SPVM107									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM107'
	,AssetFinanceHP_SPVM108									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM108'
	,AssetFinanceHP_SPVM109									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM109'
	,AssetFinanceHP_SPVM110									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM110'
	,AssetFinanceHP_SPVM111									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM111'
	,AssetFinanceHP_SPVM112									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM112'
	,AssetFinanceHP_SPVM113									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM113'
	,AssetFinanceHP_SPVM114									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM114'
	,AssetFinanceHP_SPVM115									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM115'
	,AssetFinanceHP_SPVM116									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM116'
	,AssetFinanceHP_SPVM117									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM117'
	,AssetFinanceHP_SPVM118									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM118'
	,AssetFinanceHP_SPVM119									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM119'
	,AssetFinanceHP_SPVM120									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM120'
	,AssetFinanceHP_SPVM121									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM121'
	,AssetFinanceHP_SPVM122									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM122'
	,AssetFinanceHP_SPVM123									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM123'
	,AssetFinanceHP_SPVM124									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM124'
	,AssetFinanceHP_SPVM125									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM125'
	,AssetFinanceHP_SPVM126									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM126'
	,AssetFinanceHP_SPVM127									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM127'
	,AssetFinanceHP_SPVM128									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM128'
	,AssetFinanceHP_SPVM129									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM129'
	,AssetFinanceHP_SPVM130									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM130'
	,AssetFinanceHP_SPVM131									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM131'
	,AssetFinanceHP_SPVM132									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.AssetFinanceHP.SPVM132'
	,BankCards_SPVM201									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM201'
	,BankCards_SPVM202									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM202'
	,BankCards_SPVM203									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM203'
	,BankCards_SPVM204									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM204'
	,BankCards_SPVM205									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM205'
	,BankCards_SPVM206									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM206'
	,BankCards_SPVM207									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM207'
	,BankCards_SPVM208									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM208'
	,BankCards_SPVM209									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM209'
	,BankCards_SPVM210									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM210'
	,BankCards_SPVM211									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM211'
	,BankCards_SPVM212									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM212'
	,BankCards_SPVM213									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM213'
	,BankCards_SPVM214									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM214'
	,BankCards_SPVM215									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM215'
	,BankCards_SPVM216									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM216'
	,BankCards_SPVM217									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM217'
	,BankCards_SPVM218									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM218'
	,BankCards_SPVM219									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM219'
	,BankCards_SPVM220									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM220'
	,BankCards_SPVM221									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM221'
	,BankCards_SPVM222									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM222'
	,BankCards_SPVM223									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM223'
	,BankCards_SPVM224									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM224'
	,BankCards_SPVM225									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM225'
	,BankCards_SPVM226									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM226'
	,BankCards_SPVM227									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM227'
	,BankCards_SPVM228									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM228'
	,BankCards_SPVM229									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM229'
	,BankCards_SPVM230									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM230'
	,BankCards_SPVM231									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM231'
	,BankCards_SPVM232									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM232'
	,BankCards_SPVM233									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM233'
	,BankCards_SPVM234									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM234'
	,BankCards_SPVM235									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM235'
	,BankCards_SPVM236									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM236'
	,BankCards_SPVM237									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM237'
	,BankCards_SPVM238									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM238'
	,BankCards_SPVM239									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM239'
	,BankCards_SPVM240									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM240'
	,BankCards_SPVM241									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.BankCards.SPVM241'
	,CreditSales_SPVM101									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM101'
	,CreditSales_SPVM102									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM102'
	,CreditSales_SPVM103									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM103'
	,CreditSales_SPVM104									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM104'
	,CreditSales_SPVM105									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM105'
	,CreditSales_SPVM106									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM106'
	,CreditSales_SPVM107									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM107'
	,CreditSales_SPVM108									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM108'
	,CreditSales_SPVM109									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM109'
	,CreditSales_SPVM110									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM110'
	,CreditSales_SPVM111									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM111'
	,CreditSales_SPVM112									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM112'
	,CreditSales_SPVM113									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM113'
	,CreditSales_SPVM114									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM114'
	,CreditSales_SPVM115									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM115'
	,CreditSales_SPVM116									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM116'
	,CreditSales_SPVM117									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM117'
	,CreditSales_SPVM118									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM118'
	,CreditSales_SPVM119									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM119'
	,CreditSales_SPVM120									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM120'
	,CreditSales_SPVM121									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM121'
	,CreditSales_SPVM122									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM122'
	,CreditSales_SPVM123									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM123'
	,CreditSales_SPVM124									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM124'
	,CreditSales_SPVM125									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM125'
	,CreditSales_SPVM126									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM126'
	,CreditSales_SPVM127									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM127'
	,CreditSales_SPVM128									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM128'
	,CreditSales_SPVM129									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM129'
	,CreditSales_SPVM130									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM130'
	,CreditSales_SPVM131									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM131'
	,CreditSales_SPVM132									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CreditSales.SPVM132'
	,CurrentAccounts_SPVM201									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM201'
	,CurrentAccounts_SPVM202									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM202'
	,CurrentAccounts_SPVM203									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM203'
	,CurrentAccounts_SPVM204									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM204'
	,CurrentAccounts_SPVM205									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM205'
	,CurrentAccounts_SPVM206									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM206'
	,CurrentAccounts_SPVM207									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM207'
	,CurrentAccounts_SPVM208									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM208'
	,CurrentAccounts_SPVM209									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM209'
	,CurrentAccounts_SPVM210									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM210'
	,CurrentAccounts_SPVM211									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM211'
	,CurrentAccounts_SPVM212									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM212'
	,CurrentAccounts_SPVM213									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM213'
	,CurrentAccounts_SPVM214									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM214'
	,CurrentAccounts_SPVM215									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM215'
	,CurrentAccounts_SPVM216									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM216'
	,CurrentAccounts_SPVM217									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM217'
	,CurrentAccounts_SPVM218									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM218'
	,CurrentAccounts_SPVM219									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM219'
	,CurrentAccounts_SPVM220									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM220'
	,CurrentAccounts_SPVM221									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM221'
	,CurrentAccounts_SPVM222									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM222'
	,CurrentAccounts_SPVM223									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM223'
	,CurrentAccounts_SPVM224									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM224'
	,CurrentAccounts_SPVM225									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM225'
	,CurrentAccounts_SPVM226									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM226'
	,CurrentAccounts_SPVM227									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM227'
	,CurrentAccounts_SPVM228									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM228'
	,CurrentAccounts_SPVM229									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM229'
	,CurrentAccounts_SPVM230									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM230'
	,CurrentAccounts_SPVM231									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM231'
	,CurrentAccounts_SPVM232									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM232'
	,CurrentAccounts_SPVM233									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM233'
	,CurrentAccounts_SPVM234									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM234'
	,CurrentAccounts_SPVM235									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM235'
	,CurrentAccounts_SPVM236									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM236'
	,CurrentAccounts_SPVM237									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM237'
	,CurrentAccounts_SPVM238									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM238'
	,CurrentAccounts_SPVM239									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM239'
	,CurrentAccounts_SPVM240									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM240'
	,CurrentAccounts_SPVM241									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.CurrentAccounts.SPVM241'
	,MailOrderHomeShopping_SPVM201									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM201'
	,MailOrderHomeShopping_SPVM202									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM202'
	,MailOrderHomeShopping_SPVM203									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM203'
	,MailOrderHomeShopping_SPVM204									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM204'
	,MailOrderHomeShopping_SPVM205									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM205'
	,MailOrderHomeShopping_SPVM206									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM206'
	,MailOrderHomeShopping_SPVM207									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM207'
	,MailOrderHomeShopping_SPVM208									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM208'
	,MailOrderHomeShopping_SPVM209									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM209'
	,MailOrderHomeShopping_SPVM210									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM210'
	,MailOrderHomeShopping_SPVM211									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM211'
	,MailOrderHomeShopping_SPVM212									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM212'
	,MailOrderHomeShopping_SPVM213									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM213'
	,MailOrderHomeShopping_SPVM214									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM214'
	,MailOrderHomeShopping_SPVM215									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM215'
	,MailOrderHomeShopping_SPVM216									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM216'
	,MailOrderHomeShopping_SPVM217									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM217'
	,MailOrderHomeShopping_SPVM218									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM218'
	,MailOrderHomeShopping_SPVM219									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM219'
	,MailOrderHomeShopping_SPVM220									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM220'
	,MailOrderHomeShopping_SPVM221									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM221'
	,MailOrderHomeShopping_SPVM222									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM222'
	,MailOrderHomeShopping_SPVM223									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM223'
	,MailOrderHomeShopping_SPVM224									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM224'
	,MailOrderHomeShopping_SPVM225									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM225'
	,MailOrderHomeShopping_SPVM226									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM226'
	,MailOrderHomeShopping_SPVM227									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM227'
	,MailOrderHomeShopping_SPVM228									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM228'
	,MailOrderHomeShopping_SPVM229									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM229'
	,MailOrderHomeShopping_SPVM230									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM230'
	,MailOrderHomeShopping_SPVM231									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM231'
	,MailOrderHomeShopping_SPVM232									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM232'
	,MailOrderHomeShopping_SPVM233									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM233'
	,MailOrderHomeShopping_SPVM234									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM234'
	,MailOrderHomeShopping_SPVM235									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM235'
	,MailOrderHomeShopping_SPVM236									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM236'
	,MailOrderHomeShopping_SPVM237									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM237'
	,MailOrderHomeShopping_SPVM238									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM238'
	,MailOrderHomeShopping_SPVM239									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM239'
	,MailOrderHomeShopping_SPVM240									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM240'
	,MailOrderHomeShopping_SPVM241									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.MailOrderHomeShopping.SPVM241'
	,Mortgages_SPVM101									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM101'
	,Mortgages_SPVM102									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM102'
	,Mortgages_SPVM103									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM103'
	,Mortgages_SPVM104									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM104'
	,Mortgages_SPVM105									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM105'
	,Mortgages_SPVM106									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM106'
	,Mortgages_SPVM107									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM107'
	,Mortgages_SPVM108									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM108'
	,Mortgages_SPVM109									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM109'
	,Mortgages_SPVM110									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM110'
	,Mortgages_SPVM111									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM111'
	,Mortgages_SPVM112									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM112'
	,Mortgages_SPVM113									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM113'
	,Mortgages_SPVM114									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM114'
	,Mortgages_SPVM115									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM115'
	,Mortgages_SPVM116									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM116'
	,Mortgages_SPVM117									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM117'
	,Mortgages_SPVM118									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM118'
	,Mortgages_SPVM119									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM119'
	,Mortgages_SPVM120									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM120'
	,Mortgages_SPVM121									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM121'
	,Mortgages_SPVM122									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM122'
	,Mortgages_SPVM123									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM123'
	,Mortgages_SPVM124									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM124'
	,Mortgages_SPVM125									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM125'
	,Mortgages_SPVM126									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM126'
	,Mortgages_SPVM127									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM127'
	,Mortgages_SPVM128									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM128'
	,Mortgages_SPVM129									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM129'
	,Mortgages_SPVM130									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM130'
	,Mortgages_SPVM131									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM131'
	,Mortgages_SPVM132									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Mortgages.SPVM132'
	,RetailStoreCards_SPVM201									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM201'
	,RetailStoreCards_SPVM202									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM202'
	,RetailStoreCards_SPVM203									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM203'
	,RetailStoreCards_SPVM204									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM204'
	,RetailStoreCards_SPVM205									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM205'
	,RetailStoreCards_SPVM206									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM206'
	,RetailStoreCards_SPVM207									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM207'
	,RetailStoreCards_SPVM208									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM208'
	,RetailStoreCards_SPVM209									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM209'
	,RetailStoreCards_SPVM210									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM210'
	,RetailStoreCards_SPVM211									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM211'
	,RetailStoreCards_SPVM212									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM212'
	,RetailStoreCards_SPVM213									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM213'
	,RetailStoreCards_SPVM214									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM214'
	,RetailStoreCards_SPVM215									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM215'
	,RetailStoreCards_SPVM216									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM216'
	,RetailStoreCards_SPVM217									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM217'
	,RetailStoreCards_SPVM218									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM218'
	,RetailStoreCards_SPVM219									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM219'
	,RetailStoreCards_SPVM220									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM220'
	,RetailStoreCards_SPVM221									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM221'
	,RetailStoreCards_SPVM222									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM222'
	,RetailStoreCards_SPVM223									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM223'
	,RetailStoreCards_SPVM224									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM224'
	,RetailStoreCards_SPVM225									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM225'
	,RetailStoreCards_SPVM226									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM226'
	,RetailStoreCards_SPVM227									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM227'
	,RetailStoreCards_SPVM228									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM228'
	,RetailStoreCards_SPVM229									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM229'
	,RetailStoreCards_SPVM230									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM230'
	,RetailStoreCards_SPVM231									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM231'
	,RetailStoreCards_SPVM232									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM232'
	,RetailStoreCards_SPVM233									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM233'
	,RetailStoreCards_SPVM234									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM234'
	,RetailStoreCards_SPVM235									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM235'
	,RetailStoreCards_SPVM236									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM236'
	,RetailStoreCards_SPVM237									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM237'
	,RetailStoreCards_SPVM238									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM238'
	,RetailStoreCards_SPVM239									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM239'
	,RetailStoreCards_SPVM240									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM240'
	,RetailStoreCards_SPVM241									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.RetailStoreCards.SPVM241'
	,SecuredLoans_SPVM101									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM101'
	,SecuredLoans_SPVM102									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM102'
	,SecuredLoans_SPVM103									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM103'
	,SecuredLoans_SPVM104									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM104'
	,SecuredLoans_SPVM105									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM105'
	,SecuredLoans_SPVM106									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM106'
	,SecuredLoans_SPVM107									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM107'
	,SecuredLoans_SPVM108									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM108'
	,SecuredLoans_SPVM109									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM109'
	,SecuredLoans_SPVM110									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM110'
	,SecuredLoans_SPVM111									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM111'
	,SecuredLoans_SPVM112									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM112'
	,SecuredLoans_SPVM113									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM113'
	,SecuredLoans_SPVM114									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM114'
	,SecuredLoans_SPVM115									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM115'
	,SecuredLoans_SPVM116									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM116'
	,SecuredLoans_SPVM117									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM117'
	,SecuredLoans_SPVM118									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM118'
	,SecuredLoans_SPVM119									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM119'
	,SecuredLoans_SPVM120									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM120'
	,SecuredLoans_SPVM121									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM121'
	,SecuredLoans_SPVM122									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM122'
	,SecuredLoans_SPVM123									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM123'
	,SecuredLoans_SPVM124									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM124'
	,SecuredLoans_SPVM125									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM125'
	,SecuredLoans_SPVM126									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM126'
	,SecuredLoans_SPVM127									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM127'
	,SecuredLoans_SPVM128									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM128'
	,SecuredLoans_SPVM129									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM129'
	,SecuredLoans_SPVM130									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM130'
	,SecuredLoans_SPVM131									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM131'
	,SecuredLoans_SPVM132									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.SecuredLoans.SPVM132'
	,UnsecuredLoans_SPVM101									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM101'
	,UnsecuredLoans_SPVM102									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM102'
	,UnsecuredLoans_SPVM103									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM103'
	,UnsecuredLoans_SPVM104									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM104'
	,UnsecuredLoans_SPVM105									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM105'
	,UnsecuredLoans_SPVM106									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM106'
	,UnsecuredLoans_SPVM107									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM107'
	,UnsecuredLoans_SPVM108									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM108'
	,UnsecuredLoans_SPVM109									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM109'
	,UnsecuredLoans_SPVM110									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM110'
	,UnsecuredLoans_SPVM111									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM111'
	,UnsecuredLoans_SPVM112									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM112'
	,UnsecuredLoans_SPVM113									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM113'
	,UnsecuredLoans_SPVM114									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM114'
	,UnsecuredLoans_SPVM115									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM115'
	,UnsecuredLoans_SPVM116									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM116'
	,UnsecuredLoans_SPVM117									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM117'
	,UnsecuredLoans_SPVM118									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM118'
	,UnsecuredLoans_SPVM119									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM119'
	,UnsecuredLoans_SPVM120									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM120'
	,UnsecuredLoans_SPVM121									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM121'
	,UnsecuredLoans_SPVM122									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM122'
	,UnsecuredLoans_SPVM123									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM123'
	,UnsecuredLoans_SPVM124									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM124'
	,UnsecuredLoans_SPVM125									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM125'
	,UnsecuredLoans_SPVM126									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM126'
	,UnsecuredLoans_SPVM127									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM127'
	,UnsecuredLoans_SPVM128									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM128'
	,UnsecuredLoans_SPVM129									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM129'
	,UnsecuredLoans_SPVM130									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM130'
	,UnsecuredLoans_SPVM131									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM131'
	,UnsecuredLoans_SPVM132									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.UnsecuredLoans.SPVM132'
	,Utilities_SPVM101									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM101'
	,Utilities_SPVM102									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM102'
	,Utilities_SPVM103									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM103'
	,Utilities_SPVM104									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM104'
	,Utilities_SPVM105									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM105'
	,Utilities_SPVM106									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM106'
	,Utilities_SPVM107									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM107'
	,Utilities_SPVM108									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM108'
	,Utilities_SPVM109									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM109'
	,Utilities_SPVM110									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM110'
	,Utilities_SPVM111									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM111'
	,Utilities_SPVM112									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM112'
	,Utilities_SPVM113									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM113'
	,Utilities_SPVM114									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM114'
	,Utilities_SPVM115									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM115'
	,Utilities_SPVM116									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM116'
	,Utilities_SPVM117									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM117'
	,Utilities_SPVM118									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM118'
	,Utilities_SPVM119									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM119'
	,Utilities_SPVM120									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM120'
	,Utilities_SPVM121									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM121'
	,Utilities_SPVM122									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM122'
	,Utilities_SPVM123									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM123'
	,Utilities_SPVM124									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM124'
	,Utilities_SPVM125									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM125'
	,Utilities_SPVM126									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM126'
	,Utilities_SPVM127									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM127'
	,Utilities_SPVM128									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM128'
	,Utilities_SPVM129									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM129'
	,Utilities_SPVM130									INT									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM130'
	,Utilities_SPVM131									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM131'
	,Utilities_SPVM132									NVARCHAR(1)									N'$.Response.ConsumerSummary.PremiumValueData.VerticalMarkets.Utilities.SPVM132'
) AS JSON
WHERE isjson(sbd.[JSON_Response]) = 1
;
GO
