/***********************************************************************************************************!
!																	 										!
!	Name:	Staging_MI.VW_ExpinCAISBlock.SQL		 				 								!
!																	 										!
!	Type:	T-SQL Script											 										!
!																	 										!
!	Purpose: Extract FullConsumerData - CAIS data from Zoot (Full DelphiSelect Response)					!
!																	 										!
!																	 										!
!																											!
!===========================================================================================================!
!																											!
! Change Log																								!
!																											!
!===========================================================================================================!
! Version	!	Changed By	!   Date		!			Comments			 								!
!===========!===============!===============!===============================================================!
!	0.1		!	   BTR		! 2021-11-14	! 	Version for BI									!
!																											!
!************************************************************************************************************/

/*
	* CAIS Block is one of the more complex blocks in the response (many SubBlocks that create a 1-to-many relationship).
	* Beyound the Main CAIS block itself  there are 5 sub-Blocks, each with a 1 to many relationship to the main CAIS Block itself
	* Only way I see to shread this without losing anything is to set each up as its own view
	* That gives 6 total views though, for 1 block of data (granted, one of if not the most important block in the Experian Response)


	* JSON_VALUE is used heavilly here, allows the KEY value of each JSON Array to be returned, works as a row ID of sorts
	* all datatypes are NVARCHAR(4000) as a result

	Views
	-----
	1. CAIS Block itself,	$.Response.FullConsumerData.ConsumerData.CAIS.CAISDetails (expect always populated for a ZootTransactionID)
	2. Account Balances,	$.Response.FullConsumerData.ConsumerData.CAIS.CAISDetails.AccountBalances (Also expect always populated, 1 to many for each record in the CAIS account (i.e. first) block)

	--Rest of these are not always populated, use vary depending on CAIS Account type?
	3. Repayment Periods,		$.Response.FullConsumerData.ConsumerData.CAIS.CAISDetails.RepaymentPeriods
	4. MnthlyRepayment,			$.Response.FullConsumerData.ConsumerData.CAIS.CAISDetails.MnthlyRepayment
	5. CardHistories,			$.Response.FullConsumerData.ConsumerData.CAIS.CAISDetails.CardHistories
	6. CredLimitHistories,		$.Response.FullConsumerData.ConsumerData.CAIS.CAISDetails.CredLimitHistories


*/


/*======================*/
/* Main CAIS Block		*/
/*======================*/
/*This approach IS Slower then the OPENJson logic (tested outside this script), but this retains the Array Keys needed to refer back to an indiviual CAIS Account*/

DROP VIEW [Delphi].[VW_DelphiCAISBlock];
GO


CREATE VIEW [Delphi].[VW_DelphiCAISBlock] AS
SELECT
	 sbd.__PK
	,sbd.ID
	,cais_details.*

FROM [Delphi].[ECTDB_UAT_Raw_Stg]  AS sbd
CROSS APPLY Openjson(sbd.[JSON_Response], N'$.Response.FullConsumerData.ConsumerData.CAIS') WITH (
	 LocationIndicator			NVARCHAR(1)			'$.LocationIndicator'
	,ApplicantIndicator			NVARCHAR(1)			'$.ApplicantIndicator'
	,CAISDetails				NVARCHAR(MAX)		'$.CAISDetails'	AS JSON
) AS cais
CROSS APPLY openjson(cais.[CAISDetails], N'$') WITH (
	InformationSource		NVARCHAR(100)		'$.InformationSource'
	,Payment				NVARCHAR(10)		'$.Payment'
	,JointAccount			NVARCHAR(1)			'$.JointAccount'
	,AccountStatusCodes		NVARCHAR(80)		'$.AccountStatusCodes'
	,Status1To2				NVARCHAR(2)			'$.Status1To2'
	,StatusTo3				NVARCHAR(2)			'$.StatusTo3'
	,NumOfMonthsHistory		INT					'$.NumOfMonthsHistory'
	,CAISAccStartDate		NVARCHAR(10)		'$.CAISAccStartDate'
	,SettlementDate			NVARCHAR(10)		'$.SettlementDate'
	,SettleDateCaption		NVARCHAR(5)			'$.SettleDateCaption'
	,LastUpdatedDate		NVARCHAR(10)		'$.LastUpdatedDate'
	,CMLLocationType		NVARCHAR(5)			'$.CMLLocationType'
	,BankFlag				NVARCHAR(5)			'$.BankFlag'
	,WorstStatus			NVARCHAR(5)			'$.WorstStatus'
	,OwnData				NVARCHAR(5)			'$.OwnData'

	,SpecialInstrInd					NVARCHAR(5)		'$.SpecialInstrInd'
	,SpecialInstrDet_StartDate			NVARCHAR(10)	'$.SpecialInstrDet.StartDate'
	,SpecialInstrDet_RevisedPayment		NVARCHAR(10)	'$.SpecialInstrDet.RevisedPayment'
	,SpecialInstrDet_EndDate			NVARCHAR(10)	'$.SpecialInstrDet.EndDate'

	,RepaymentPeriod		INT					'$.RepaymentPeriod'
	,NoOfRepaymntPeriod		INT					'$.NoOfRepaymntPeriod'
	,NoOfPayments			INT					'$.NoOfPayments'
	--,'$.DateOfBirth'
	--,'$.Sex'
	,FSCCUGIndicator		NVARCHAR(5)			'$.FSCCUGIndicator'
	,PaymentFrequency		NVARCHAR(5)			'$.PaymentFrequency'
	,AccountStatus			NVARCHAR(5)			'$.AccountStatus'
	,NumAddInfoBlocks		INT					'$.NumAddInfoBlocks'
	,NumAccountBalances		INT					'$.NumAccountBalances'
	,NumCardHistories		INT					'$.NumCardHistories'
	,NumCreditLimChngs		INT					'$.NumCreditLimChngs'
	,NumStatuses			INT					'$.NumStatuses'
	,CompanyType			NVARCHAR(5)			'$.CompanyType'
	,AccountType			NVARCHAR(5)			'$.AccountType'
	,SourceCode				NVARCHAR(5)			'$.SourceCode'
	,AccountNumber			NVARCHAR(30)		'$.AccountNumber'
	,NOCReference			NVARCHAR(10)		'$.NOCReference'
	,SupplyCompanyName		NVARCHAR(50)		'$.SupplyCompanyName'
	,DefaultSatisfyDate		NVARCHAR(10)		'$.DefaultSatisfyDate'
	,TransColnAcntFlag		NVARCHAR(5)			'$.TransColnAcntFlag'
	,StreetMatchLevel			NVARCHAR(5)			'$.MatchDetails.StreetMatchLevel'
	,HouseMatchLevel			NVARCHAR(5)			'$.MatchDetails.HouseMatchLevel'
	,ForenameMatchLevel			NVARCHAR(5)			'$.MatchDetails.ForenameMatchLevel'
	,SurnameMatchLevel			NVARCHAR(5)			'$.MatchDetails.SurnameMatchLevel'
	,BureauRefCategory			NVARCHAR(5)			'$.MatchDetails.BureauRefCategory'
	,MatchTo					NVARCHAR(5)			'$.MatchDetails.MatchTo'
	,MatchType					NVARCHAR(5)			'$.MatchDetails.MatchType'
	--,'$.Name'
	--,'$.Name.Title'
	--,'$.Name.Forename'
	--,'$.Name.MiddleName'
	--,'$.Name.Surname'
	--,'$.Name.Suffix'
	--,'$.Name.Prefix'
	--,'$.Location'
	--,'$.Location.Flat'
	--,'$.Location.HouseName'
	--,'$.Location.HouseNumber'
	--,'$.Location.Street'
	--,'$.Location.Street2'
	--,'$.Location.District'
	--,'$.Location.District2'
	--,'$.Location.PostTown'
	--,'$.Location.Country'
	--,'$.Location.Postcode'
	--,'$.Location.POBox'
	--,'$.Location.County'
	--,'$.Location.SharredLetterbox'
	,CreditLimit_Amount				NVARCHAR(10)		'$.CreditLimit.Amount'
	,CreditLimit_ANarrative			NVARCHAR(10)		'$.CreditLimit.Narrative'
	,CreditLimit_Caption			NVARCHAR(10)		'$.CreditLimit.Caption'
	,Balance_Amount					NVARCHAR(10)		'$.Balance.Amount'
	,Balance_Narrative				NVARCHAR(10)		'$.Balance.Narrative'
	,Balance_Caption				NVARCHAR(10)		'$.Balance.Caption'
	,CurrentDefBalance_Amount		NVARCHAR(10)		'$.CurrentDefBalance.Amount'
	,CurrentDefBalance_Narraitve	NVARCHAR(10)		'$.CurrentDefBalance.Narrative'
	,DelinquentBalance_Amount		NVARCHAR(10)		'$.DelinquentBalance.Amount'
	,DelinquentBalance_Narrative	NVARCHAR(10)		'$.DelinquentBalance.Narrative'
	,CardHistories_PrevStatementBal		NVARCHAR(10)	'$.CardHistories.PrevStatementBal'
	,CardHistories_PromotionalRate		NVARCHAR(10)	'$.CardHistories.PromotionalRate'
	,CardHistories_PaymentAmount		NVARCHAR(10)	'$.CardHistories.PaymentAmount'
	,CardHistories_NumCashAdvances		NVARCHAR(10)	'$.CardHistories.NumCashAdvances'
	,CardHistories_CashAdvanceAmount	NVARCHAR(10)	'$.CardHistories.CashAdvanceAmount'
	,CardHistories_PaymentCode			NVARCHAR(10)	'$.CardHistories.PaymentCode'

	,AccountBalances					NVARCHAR(MAX)	'$.AccountBalances'		AS JSON
	,RepaymentPeriods					NVARCHAR(MAX)	'$.RepaymentPeriods'	AS JSON
	,CredLimitHistories					NVARCHAR(MAX)	'$.CredLimitHistories'	AS JSON
	,CardHistories						NVARCHAR(MAX)	'$.CardHistories'		AS JSON
	,AdditionalInfoBlocks				NVARCHAR(MAX)	'$.AdditionalInfoBlocks'	AS JSON
) AS cais_details
WHERE ISJSON(sbd.[JSON_Response]) = 1
;

GO


