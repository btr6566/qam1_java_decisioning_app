/*========================================================

    Server = btrqasdlvl4.database.windows.net

==========================================================*/

SELECT
    min([__PK]) AS __MIN
    ,max([__PK]) AS __MAX
FROM [Delphi].[ECTDB_UAT_Raw_Stg] --What the views are based on
;
GO

/*
    min = 1
    max = 10000
*/
