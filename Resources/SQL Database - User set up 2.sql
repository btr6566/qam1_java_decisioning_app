/*

Must be using:
    Connection = btrqasdlvl4.database.windows.net
    Database = QA_Apply_1

This creates the actual user + grants the permissions

- Creating the Login must be done on the Master Db
- The user & the permissions are on the actual Server database

*/


--User is Seperate
CREATE USER jdbc_integration_user FROM LOGIN jdbc_integration_user;
GO 


-----------
-- Permissions
-----------

--SELECT
EXEC sp_addrolemember 'db_datareader', 'jdbc_integration_user'
GO
