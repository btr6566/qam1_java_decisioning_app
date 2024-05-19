/*

Must be using:
    Connection = btrqasdlvl4.database.windows.net
    Database = master

*/


--Clean up
DROP USER jdbc_integration_user;
DROP LOGIN jdbc_integration_user;
GO

--Create Login
CREATE LOGIN jdbc_integration_user 
WITH
    PASSWORD = 'tCL8s0&s£2q3'
;
GO




--User is Seperate
-- CREATE USER jdbc_integration_user FROM LOGIN jdbc_integration_user;
-- GO 

-----------
-- Permissions
-----------

--Give SELECT Permissions on the Database
-- EXEC sp_addrolemember 'db_datareader', 'jdbc_integration_user'
-- GO




--==============
-- Look at DB Admin views
--=============
SELECT *
FROM [sys].[credentials]
;

SELECT *
FROM [sys].[schemas]
;


