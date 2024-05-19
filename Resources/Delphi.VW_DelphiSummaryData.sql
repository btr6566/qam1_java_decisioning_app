/*******************************************************************************************************!
!																	 									!
!	Name:	SHRED Consumer Summary - Sumamry Block.SQL		 						 					!
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
	*	Names are padded with what Block they are sourced from, due to variable names being reused in different blocks (happens in PremiumValue Data, applied here for consistency)


Notes
-----
	* Using LAX JSON paths (the default), so if a value is NULL, the entire thing does not error (values are not necessarially expected)
	* only valid JSON values are used, using the ISJSON function


*/

DROP VIEW [Delphi].[VW_DelphiSummaryData];
GO


CREATE VIEW [Delphi].[VW_DelphiSummaryData] AS
SELECT
	 sbd.__PK
	,sbd.ID
	,JSON.*
FROM [Delphi].[ECTDB_UAT_Raw_Stg] AS sbd 
CROSS APPLY Openjson(sbd.[JSON_Response]) WITH (
	 ElectoralRoll_E4Q01									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q01'
	,ElectoralRoll_E4Q02									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q02'
	,ElectoralRoll_E4Q03									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q03'
	,ElectoralRoll_E4Q04									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q04'
	,ElectoralRoll_E4Q05									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q05'
	,ElectoralRoll_E4Q06									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q06'
	,ElectoralRoll_E4Q07									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q07'
	,ElectoralRoll_E4Q08									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q08'
	,ElectoralRoll_E4Q09									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q09'
	,ElectoralRoll_E4Q10									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q10'
	,ElectoralRoll_E4Q11									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q11'
	,ElectoralRoll_E4Q12									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q12'
	,ElectoralRoll_E4Q13									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q13'
	,ElectoralRoll_E4Q14									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q14'
	,ElectoralRoll_E4Q15									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q15'
	,ElectoralRoll_E4Q16									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q16'
	,ElectoralRoll_E4Q17									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q17'
	,ElectoralRoll_E4Q18									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4Q18'
	,ElectoralRoll_E4R01									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4R01'
	,ElectoralRoll_E4R02									NVARCHAR(8)									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4R02'
	,ElectoralRoll_E4R03									NVARCHAR(8)									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.E4R03'
	,ElectoralRoll_EA4R01PM									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.EA4R01PM'
	,ElectoralRoll_EA4R01CJ									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.EA4R01CJ'
	,ElectoralRoll_EA4R01PJ									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.EA4R01PJ'
	,ElectoralRoll_NDERL01									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.NDERL01'
	,ElectoralRoll_NDERL02									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.NDERL02'
	,ElectoralRoll_EA2Q01									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.EA2Q01'
	,ElectoralRoll_EA2Q02									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.EA2Q02'
	,ElectoralRoll_NDERLMACA									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.NDERLMACA'
	,ElectoralRoll_NDERLMAPA									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.NDERLMAPA'
	,ElectoralRoll_NDERLJACA									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.NDERLJACA'
	,ElectoralRoll_NDERLJAPA									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.NDERLJAPA'
	,ElectoralRoll_EA5U01									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.EA5U01'
	,ElectoralRoll_EA5U02									INT									N'$.Response.ConsumerSummary.Summary.ElectoralRoll.EA5U02'
	,PublicInfo_E1A01									INT									N'$.Response.ConsumerSummary.Summary.PublicInfo.E1A01'
	,PublicInfo_E1A02									INT									N'$.Response.ConsumerSummary.Summary.PublicInfo.E1A02'
	,PublicInfo_E1A03									INT									N'$.Response.ConsumerSummary.Summary.PublicInfo.E1A03'
	,PublicInfo_EA1C01									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.PublicInfo.EA1C01'
	,PublicInfo_EA1D01									INT									N'$.Response.ConsumerSummary.Summary.PublicInfo.EA1D01'
	,PublicInfo_EA1D02									INT									N'$.Response.ConsumerSummary.Summary.PublicInfo.EA1D02'
	,PublicInfo_EA1D03									INT									N'$.Response.ConsumerSummary.Summary.PublicInfo.EA1D03'
	,PublicInfo_E2G01									INT									N'$.Response.ConsumerSummary.Summary.PublicInfo.E2G01'
	,PublicInfo_E2G02									INT									N'$.Response.ConsumerSummary.Summary.PublicInfo.E2G02'
	,PublicInfo_E2G03									INT									N'$.Response.ConsumerSummary.Summary.PublicInfo.E2G03'
	,PublicInfo_EA2I01									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.PublicInfo.EA2I01'
	,PublicInfo_EA2J01									INT									N'$.Response.ConsumerSummary.Summary.PublicInfo.EA2J01'
	,PublicInfo_EA2J02									INT									N'$.Response.ConsumerSummary.Summary.PublicInfo.EA2J02'
	,PublicInfo_EA2J03									INT									N'$.Response.ConsumerSummary.Summary.PublicInfo.EA2J03'
	,PublicInfo_EA4Q06									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.PublicInfo.EA4Q06'
	,PublicInfo_SPBRPRESENT									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.PublicInfo.SPBRPRESENT'
	,PublicInfo_SPABRPRESENT									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.PublicInfo.SPABRPRESENT'
	,CAIS_E1A04									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1A04'
	,CAIS_E1A05									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1A05'
	,CAIS_E1A06									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1A06'
	,CAIS_E1A07									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1A07'
	,CAIS_E1A08									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1A08'
	,CAIS_E1A09									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1A09'
	,CAIS_E1A10									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1A10'
	,CAIS_E1A11									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1A11'
	,CAIS_E1B01									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1B01'
	,CAIS_E1B02									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1B02'
	,CAIS_E1B03									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.E1B03'
	,CAIS_E1B04									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1B04'
	,CAIS_E1B05									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.E1B05'
	,CAIS_E1B06									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1B06'
	,CAIS_E1B07									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.E1B07'
	,CAIS_E1B08									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.E1B08'
	,CAIS_E1B09									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1B09'
	,CAIS_E1B10									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1B10'
	,CAIS_E1B11									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1B11'
	,CAIS_E1B12									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1B12'
	,CAIS_E1B13									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1B13'
	,CAIS_NDECC01									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDECC01'
	,CAIS_NDECC02									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDECC02'
	,CAIS_NDECC03									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDECC03'
	,CAIS_NDECC04									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDECC04'
	,CAIS_NDECC07									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDECC07'
	,CAIS_NDECC08									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDECC08'
	,CAIS_E1C01									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.E1C01'
	,CAIS_E1C02									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1C02'
	,CAIS_E1C03									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1C03'
	,CAIS_E1C04									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1C04'
	,CAIS_E1C05									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1C05'
	,CAIS_E1C06									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1C06'
	,CAIS_EA1B02									INT									N'$.Response.ConsumerSummary.Summary.CAIS.EA1B02'
	,CAIS_E1D01									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1D01'
	,CAIS_E1D02									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1D02'
	,CAIS_E1D03									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1D03'
	,CAIS_E1D04									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E1D04'
	,CAIS_NDHAC01									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDHAC01'
	,CAIS_NDHAC02									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDHAC02'
	,CAIS_NDHAC03									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDHAC03'
	,CAIS_NDHAC04									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDHAC04'
	,CAIS_NDHAC05									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDHAC05'
	,CAIS_NDHAC09									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDHAC09'
	,CAIS_NDINC01									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDINC01'
	,CAIS_EA1F01									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.EA1F01'
	,CAIS_EA1F02									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.EA1F02'
	,CAIS_EA1F03									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.EA1F03'
	,CAIS_NDFCS01									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.NDFCS01'
	,CAIS_EA1F04									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.EA1F04'
	,CAIS_E2G04									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2G04'
	,CAIS_E2G05									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2G05'
	,CAIS_E2G06									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2G06'
	,CAIS_E2G07									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2G07'
	,CAIS_E2G08									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2G08'
	,CAIS_E2G09									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2G09'
	,CAIS_E2G10									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2G10'
	,CAIS_E2G11									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2G11'
	,CAIS_E2H01									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2H01'
	,CAIS_E2H02									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2H02'
	,CAIS_E2H03									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.E2H03'
	,CAIS_E2H04									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2H04'
	,CAIS_E2H05									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.E2H05'
	,CAIS_E2H06									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2H06'
	,CAIS_E2H07									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.E2H07'
	,CAIS_E2H08									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.E2H08'
	,CAIS_E2H09									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2H09'
	,CAIS_E2H10									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2H10'
	,CAIS_E2H11									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2H11'
	,CAIS_E2H12									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2H12'
	,CAIS_E2H13									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2H13'
	,CAIS_NDECC05									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDECC05'
	,CAIS_NDECC09									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDECC09'
	,CAIS_NDECC10									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDECC10'
	,CAIS_E2I01									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.E2I01'
	,CAIS_E2I02									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2I02'
	,CAIS_E2I03									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2I03'
	,CAIS_E2I04									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2I04'
	,CAIS_E2I05									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2I05'
	,CAIS_E2I06									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2I06'
	,CAIS_EA2H02									INT									N'$.Response.ConsumerSummary.Summary.CAIS.EA2H02'
	,CAIS_E2J01									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2J01'
	,CAIS_E2J02									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2J02'
	,CAIS_E2J03									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2J03'
	,CAIS_E2J04									INT									N'$.Response.ConsumerSummary.Summary.CAIS.E2J04'
	,CAIS_NDHAC10									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDHAC10'
	,CAIS_NDHAC06									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDHAC06'
	,CAIS_NDHAC07									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDHAC07'
	,CAIS_NDHAC08									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDHAC08'
	,CAIS_NDINC02									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDINC02'
	,CAIS_EA2L01									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.EA2L01'
	,CAIS_EA2L02									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.EA2L02'
	,CAIS_EA2L03									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.EA2L03'
	,CAIS_NDFCS02									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.NDFCS02'
	,CAIS_EA2L04									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CAIS.EA2L04'
	,CAIS_NDECC06									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDECC06'
	,CAIS_NDINC03									INT									N'$.Response.ConsumerSummary.Summary.CAIS.NDINC03'
	,CAPS_E1E01									INT									N'$.Response.ConsumerSummary.Summary.CAPS.E1E01'
	,CAPS_E1E02									INT									N'$.Response.ConsumerSummary.Summary.CAPS.E1E02'
	,CAPS_EA1B01									INT									N'$.Response.ConsumerSummary.Summary.CAPS.EA1B01'
	,CAPS_NDPSD01									INT									N'$.Response.ConsumerSummary.Summary.CAPS.NDPSD01'
	,CAPS_NDPSD02									INT									N'$.Response.ConsumerSummary.Summary.CAPS.NDPSD02'
	,CAPS_NDPSD03									INT									N'$.Response.ConsumerSummary.Summary.CAPS.NDPSD03'
	,CAPS_NDPSD04									INT									N'$.Response.ConsumerSummary.Summary.CAPS.NDPSD04'
	,CAPS_NDPSD05									INT									N'$.Response.ConsumerSummary.Summary.CAPS.NDPSD05'
	,CAPS_NDPSD06									INT									N'$.Response.ConsumerSummary.Summary.CAPS.NDPSD06'
	,CAPS_EA1E01									INT									N'$.Response.ConsumerSummary.Summary.CAPS.EA1E01'
	,CAPS_EA1E02									INT									N'$.Response.ConsumerSummary.Summary.CAPS.EA1E02'
	,CAPS_EA1E03									INT									N'$.Response.ConsumerSummary.Summary.CAPS.EA1E03'
	,CAPS_EA1E04									INT									N'$.Response.ConsumerSummary.Summary.CAPS.EA1E04'
	,CAPS_E2K01									INT									N'$.Response.ConsumerSummary.Summary.CAPS.E2K01'
	,CAPS_E2K02									INT									N'$.Response.ConsumerSummary.Summary.CAPS.E2K02'
	,CAPS_EA2H01									INT									N'$.Response.ConsumerSummary.Summary.CAPS.EA2H01'
	,CAPS_NDPSD07									INT									N'$.Response.ConsumerSummary.Summary.CAPS.NDPSD07'
	,CAPS_NDPSD08									INT									N'$.Response.ConsumerSummary.Summary.CAPS.NDPSD08'
	,CAPS_NDPSD09									INT									N'$.Response.ConsumerSummary.Summary.CAPS.NDPSD09'
	,CAPS_NDPSD10									INT									N'$.Response.ConsumerSummary.Summary.CAPS.NDPSD10'
	,CAPS_EA2K01									INT									N'$.Response.ConsumerSummary.Summary.CAPS.EA2K01'
	,CAPS_EA2K02									INT									N'$.Response.ConsumerSummary.Summary.CAPS.EA2K02'
	,CAPS_EA2K03									INT									N'$.Response.ConsumerSummary.Summary.CAPS.EA2K03'
	,CAPS_EA2K04									INT									N'$.Response.ConsumerSummary.Summary.CAPS.EA2K04'
	,CAPS_NDPSD11									INT									N'$.Response.ConsumerSummary.Summary.CAPS.NDPSD11'
	,CIFAS_EA1A01									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CIFAS.EA1A01'
	,CIFAS_EA2G01									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CIFAS.EA2G01'
	,CIFAS_EA4P01									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CIFAS.EA4P01'
	,CIFAS_EA4P02									INT									N'$.Response.ConsumerSummary.Summary.CIFAS.EA4P02'
	,CML_EA1C02									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CML.EA1C02'
	,CML_EA2I02									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.CML.EA2I02'
	,GAIN_EA1G01									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.GAIN.EA1G01'
	,GAIN_EA1G02									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.GAIN.EA1G02'
	,GAIN_EA2M01									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.GAIN.EA2M01'
	,GAIN_EA2M02									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.GAIN.EA2M02'
	,NOC_EA4Q07									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.NOC.EA4Q07'
	,NOC_EA4Q08									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.NOC.EA4Q08'
	,NOC_EA4Q09									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.NOC.EA4Q09'
	,NOC_EA4Q10									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.NOC.EA4Q10'
	,NOC_EA4Q11									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.NOC.EA4Q11'
	,NOC_EA4Q01									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.NOC.EA4Q01'
	,NOC_EA4Q02									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.NOC.EA4Q02'
	,NOC_EA4Q03									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.NOC.EA4Q03'
	,NOC_EA4Q04									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.NOC.EA4Q04'
	,NOC_EA4Q05									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.NOC.EA4Q05'
	,TPD_NDOPTOUT									NVARCHAR(1)									N'$.Response.ConsumerSummary.Summary.TPD.NDOPTOUT'
) AS JSON
WHERE isjson(sbd.[JSON_Response]) = 1
GO