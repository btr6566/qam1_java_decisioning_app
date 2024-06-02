


-- Try DROP TABLE IF EXISTS, this Azure's SQL Sever version suport it
DROP TABLE IF EXISTS dbo.JavaDecisioningHistory;
GO


CREATE TABLE dbo.JavaDecisioningHistory (
    ID          INT IDENTITY,
    Insert_Ts   DATETIME DEFAULT GETUTCDATE(),
    caseData    NVARCHAR(MAX)
);
GO

-- Test run
INSERT INTO dbo.JavaDecisioningHistory (caseData) VALUES('{"test":1}');

SELECT * FROM dbo.JavaDecisioningHistory;
GO

-- TRUNCATE TABLE dbo.JavaDecisioningHistory;

--Give my Integration user Write Access
GRANT INSERT ON dbo.JavaDecisioningHistory TO jdbc_integration_user;