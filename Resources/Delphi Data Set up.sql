SELECT TOP (1000)
    [ID]
    ,[AppID]
    ,[Inserted_dt]
    ,[Raw_JSON_Response]
FROM [Delphi].[ECTDB_UAT_Raw_Load]
;
GO


--Disk Space used
EXEC sp_spaceused '[Delphi].[ECTDB_UAT_Raw_Load]'

-- Check for duplicates
SELECT 
    ID
    ,count(*)
FROM [Delphi].[ECTDB_UAT_Raw_Load]
GROUP BY ID
HAVING count(*) > 1
;


--Dedup
WITH base AS (
    SELECT
        ID
        ,ROW_NUMBER() OVER(PARTITION BY ID ORDER BY Inserted_dt) AS _Row
    FROM [Delphi].[ECTDB_UAT_Raw_Load]
)
DELETE FROM base
WHERE _Row > 1
;

/*==================*/
--Clean up data
/*==================*/
IF(object_id(N'[Delphi].[ECTDB_UAT_Raw_Stg]', 'U') is not null)
    DROP TABLE [Delphi].[ECTDB_UAT_Raw_Stg] 
;

--Remove duplicated " characters
SELECT
    ID
    ,REPLACE(Raw_JSON_Response,'""','"') AS JSON_Response
INTO
    [Delphi].[ECTDB_UAT_Raw_Stg] 
FROM [Delphi].[ECTDB_UAT_Raw_Load]
;
GO

ALTER TABLE [Delphi].[ECTDB_UAT_Raw_Stg] 
ADD
    _ISJSON_Flag TINYINT
;
GO

--Remove the trailing " character, then test if JSON
UPDATE [Delphi].[ECTDB_UAT_Raw_Stg] 
SET 
    JSON_Response = SUBSTRING(JSON_Response,1,LEN(JSON_Response)-1)
    ,_ISJSON_Flag = ISJSON(SUBSTRING(JSON_Response,1,LEN(JSON_Response)-1))
;
GO

SELECT 
    _ISJSON_Flag
    ,count(*)
FROM [Delphi].[ECTDB_UAT_Raw_Stg] 
GROUP BY _ISJSON_Flag
;

-- SELECT TOP 10
--     ID
--     ,JSON_Response
--     ,_ISJSON_Flag
-- FROM [Delphi].[ECTDB_UAT_Raw_Stg] 
-- ;



/*==================*/
--add something for a PK
/*==================*/

ALTER TABLE [Delphi].[ECTDB_UAT_Raw_Stg] 
ADD
    __PK        INT
;
GO


WITH base AS (
    SELECT
        ID  AS base_ID
        ,ROW_NUMBER() OVER(ORDER BY ID) AS _ROW
    FROM    [Delphi].[ECTDB_UAT_Raw_Stg] 

)
UPDATE [Delphi].[ECTDB_UAT_Raw_Stg]
SET 
    __PK = base._ROW
FROM base
WHERE ID = base_ID
;
GO


SELECT
    ID
    ,__PK
FROM    [Delphi].[ECTDB_UAT_Raw_Stg] 
ORDER BY __PK
;
GO


/*==================*/
--
/*==================*/