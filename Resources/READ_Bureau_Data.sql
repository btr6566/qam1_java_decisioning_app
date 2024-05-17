SELECT
    su.__PK
    
    --Champion
    ,su.CAIS_E1B07
    ,su.CAIS_E1B09
    ,pv.TrendedData_TRD_A_13
    ,su.CAIS_E1A09
    ,pv.HighCostCredit_TRD_STL_14

    --Challanger
    ,pv.CII_NDSPACII
    ,pv.TrendedData_TRD_A_06
    ,su.CAIS_E1B13
    ,su.CAIS_E1B01
    ,pv.HighCostCredit_TRD_STL_19

    --POLICY
    ,su.CAIS_E1B08
    ,pv.Scoring_E5S051
FROM [Delphi].[VW_DelphiSummaryData] su
INNER JOIN [Delphi].[VW_DelphiPremiumValueData] pv ON su.__PK = pv.__PK
WHERE 
    su.__PK = 1
;